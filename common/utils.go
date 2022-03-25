package common

import (
	"archive/zip"
	"bufio"
	"bytes"
	"errors"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"reflect"
	"strconv"
	"strings"
	"time"

	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/micro/go-config"
	"github.com/micro/go-config/source/file"

	//"fmt"
	"mime/multipart"

	"github.com/astaxie/beego/orm"

	//"fmt"
	"fmt"
	"image"
	"image/jpeg"
	"image/png"
	"io/ioutil"
	"path"

	"golang.org/x/text/encoding/simplifiedchinese"
	"golang.org/x/text/transform"
)

const KDeltaFilesDir string = "deltas"
const KDownloadFilesDir string = "download"
const KBatchPostCount = 500

const KSrvDocsDir = "static/upload/docs"
const KSrvImagesDir = "static/upload/images"

var gSrvImagesPath string = ""
var gSrvDocsPath string = ""

var gWebHost string = ""
var gWebPort string = ""

func DeSqlInject(paramVal string) string {
	paramVal = strings.Replace(paramVal, "'", "", -1)
	paramVal = strings.Replace(paramVal, "--", "", -1)
	return paramVal
}

func DeSqlInject2(paramVal string) string {
	paramVal = strings.Replace(paramVal, "--", "", -1)
	return paramVal
}

func GetImagesPathConf() string {
	if gSrvImagesPath != "" {
		return gSrvImagesPath
	}

	conf := config.NewConfig()
	conf.Load(file.NewSource(
		file.WithPath("conf/config.json"),
	))

	gSrvImagesPath = conf.Get(gin.Mode(), "filesrv", "imagesPath").String(KSrvImagesDir)
	return gSrvImagesPath
}

func GetDocsPathConf() string {
	if gSrvDocsPath != "" {
		return gSrvDocsPath
	}

	conf := config.NewConfig()
	conf.Load(file.NewSource(
		file.WithPath("conf/config.json"),
	))

	gSrvDocsPath = conf.Get(gin.Mode(), "filesrv", "docsPath").String(KSrvDocsDir)
	return gSrvDocsPath
}

func ReadImage(filePath string) (image.Image, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, err
	}

	idx := strings.LastIndex(filePath, ".")
	ext := "jpg"
	if idx >= 0 {
		ext = strings.ToLower(filePath[idx:])
	}

	if ext == ".jpg" {
		img, err := jpeg.Decode(file)
		if err != nil {
			return nil, err
		}
		file.Close()

		return img, nil
	} else if ext == ".png" {
		img, err := png.Decode(file)
		if err != nil {
			return nil, err
		}
		file.Close()

		return img, nil
	}

	return nil, errors.New(ext)
}

func WriteImage(img image.Image, filePath string) error {
	out, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer out.Close()

	// write new image to file
	return jpeg.Encode(out, img, nil)
}

func ConvertFileSize(fsize int64) string {
	if fsize < 1024 {
		return fmt.Sprintf("%dB", fsize)
	} else if fsize < 1024*1024 {
		fsize2 := float64(fsize) / (1024.0)
		return fmt.Sprintf("%.2fKB", fsize2)
	} else if fsize < 1024*1024*1024 {
		fsize2 := float64(fsize) / (1024.0 * 1024)
		return fmt.Sprintf("%.2fMB", fsize2)
	}
	return fmt.Sprintf("%d", fsize)
}

func ConvertToTree(params *[]orm.Params) []orm.Params {
	return recureToTreeNode(params, TreeRootId)
}

func recureToTreeNode(params *[]orm.Params, pid string) []orm.Params {
	children := make([]orm.Params, 0)

	for _, p := range *params {
		currid := p["id"].(string)
		currpid := p["pid"].(string)
		if pid == currpid {
			childrenArray := recureToTreeNode(params, currid)
			if len(childrenArray) > 0 {
				p["children"] = childrenArray
				p["isleaf"] = 0
			} else {
				p["isleaf"] = 1
			}
			children = append(children, p)
		}
	}

	return children
}

func SetPageToken(c *gin.Context, h gin.H) {
	session := sessions.Default(c)

	var tokensarray = make([]string, 0)

	var tokens = session.Get("__token")
	if tokens != nil {
		tokenstrs := tokens.(string)
		tokensarray = strings.Split(tokenstrs, ",")
	}

	tokenlen := len(tokensarray)
	if tokenlen > 5 {
		index := tokenlen - 5
		tokensarray = tokensarray[index:]
	}

	token := NewGuid()
	tokensarray = append(tokensarray, token)

	session.Set("__token", strings.Join(tokensarray, ","))
	session.Save()

	h["__token"] = token

	//session := sessions.Default(c)
	//token := NewGuid()
	//session.Set("__token",token)
	//session.Save()
	//
	//h["__token"] = token
}

func SetCRUDStruct(h gin.H, err error, op string, entity interface{}, retentity bool) {
	h["submited"] = true

	if err != nil {
		h["isok"] = false
		h["data"] = entity
		h["msg"] = op + "失败:" + err.Error()
	} else {
		h["isok"] = true
		h["msg"] = op + "成功"
	}

	if retentity {
		h["data"] = entity
	}
}

func initWebHostConf() {
	if gWebHost == "" {
		conf := config.NewConfig()
		conf.Load(file.NewSource(
			file.WithPath("conf/config.json"),
		))

		gWebHost = conf.Get(gin.Mode(), "web", "host").String("127.0.0.1")
		gWebPort = conf.Get(gin.Mode(), "web", "port").String("8000")
	}
}

func GetUserImgUrl(userId string, pictrueId string) string {
	initWebHostConf()
	return fmt.Sprintf("http://%s:%s/images/globe/%s/%s.jpg?w=400&h=400", gWebHost, gWebPort, userId, pictrueId)
}

func SaveImage(c *gin.Context, file *multipart.FileHeader, ownerId string) string {
	var itemId = NewGuid()

	var srvDir = path.Join(GetImagesPathConf(), "globe", ownerId) //var srvDir = GetCurrPath() + KSrvImagesDir + "/" +"globe"+"/"+ ownerId + "/"

	os.MkdirAll(srvDir, os.FileMode(0755))
	//fmt.Println(err.Error())

	var srvFile = srvDir + "/" + itemId + ".jpg"
	c.SaveUploadedFile(file, srvFile)

	return itemId
}

func GetRedisConf() (string, string, string, int) {
	conf := config.NewConfig()
	conf.Load(file.NewSource(
		file.WithPath("conf/config.json"),
	))

	host := conf.Get(gin.Mode(), "redis", "host").String("localhost")
	port := conf.Get(gin.Mode(), "redis", "port").String("6379")

	password := conf.Get(gin.Mode(), "redis", "password").String("")

	poolsize := conf.Get(gin.Mode(), "redis", "poolsize").Int(10)

	return host, port, password, poolsize
}

type HttpResult struct {
	Code int    `json:"code"`
	Msg  string `json:"msg"`
}

func ReflectSetValue(entType reflect.Type, entObj reflect.Value, filedName string, v interface{}) {
	field := entObj.FieldByName(filedName)

	if entType.Kind() == reflect.Ptr {
		entType = entType.Elem()
	}

	if field.Kind() == reflect.Int64 || field.Kind() == reflect.Int {
		if vv, ok := v.(float64); ok {
			field.SetInt(int64(vv))
		}
	} else if field.Kind() == reflect.String {
		if v != nil {
			field.SetString(v.(string))
		}
	} else if field.Kind() == reflect.Float64 {
		if vv, ok := v.(float64); ok {
			field.SetFloat(vv)
		}
	} else if field.Kind() == reflect.Struct {
		fieldstruct, isok := entType.FieldByName(filedName)

		if isok && fieldstruct.Type.Name() == "Time" { //时间不是基本类型，kind 是struct
			if vv, err := time.ParseInLocation("2006-01-02T15:04:05+08:00", v.(string), time.Local); err == nil {
				vvt := reflect.ValueOf(vv)
				field.Set(vvt)
			} else {
				if vv, err := time.ParseInLocation("2006-01-02 15:04:05", v.(string), time.Local); err == nil {
					vvt := reflect.ValueOf(vv)
					field.Set(vvt)
				} else {
					if vv, err := time.ParseInLocation("2006-01-02", v.(string), time.Local); err == nil {
						vvt := reflect.ValueOf(vv)
						field.Set(vvt)
					}
				}
			}
		}
	}
}

func ReflectSetEntity(entType reflect.Type, dbentv reflect.Value, entMap map[string]interface{}, isUpdate bool) {

	if entType.Kind() == reflect.Ptr {
		entType = entType.Elem()
	}

	for k, v := range entMap {
		if isUpdate && (k == "Id") {
			continue
		}

		if v == nil {
			continue
		}

		field := dbentv.FieldByName(k)
		if field.IsValid() {
			ReflectSetValue(entType, dbentv, k, v)
		}
	}
}

/*获取当前文件执行的路径*/
func GetCurrPath() string {
	file, _ := exec.LookPath(os.Args[0])
	path, _ := filepath.Abs(file)
	splitstring := strings.Split(path, string(filepath.Separator))
	size := len(splitstring)
	splitstring = strings.Split(path, splitstring[size-1])
	ret := strings.Replace(splitstring[0], string(filepath.Separator), "/", size-1)
	return ret
}

func Substr(s string, pos, length int) string {
	runes := []rune(s)
	l := pos + length
	if l > len(runes) {
		l = len(runes)
	}
	return string(runes[pos:l])
}

func GBK2UTF8(s []byte) ([]byte, error) {
	reader := transform.NewReader(bytes.NewReader(s), simplifiedchinese.GBK.NewDecoder())
	d, e := ioutil.ReadAll(reader)
	if e != nil {
		return nil, e
	}
	return d, nil
}

func UTF82GBK(s []byte) ([]byte, error) {
	reader := transform.NewReader(bytes.NewReader(s), simplifiedchinese.GBK.NewEncoder())
	d, e := ioutil.ReadAll(reader)
	if e != nil {
		return nil, e
	}
	return d, nil
}

func GetParentDirectory(dirctory string) string {
	//if strings.LastIndex(dirctory, "/") >=0 {
	//	return Substr(dirctory, 0, strings.LastIndex(dirctory, "/"))
	//}
	//
	//return ""

	dirnames := strings.Split(strings.Trim(dirctory, "/"), "/")
	for i := len(dirnames) - 1; i >= 0; i-- {
		if dirnames[i] == "" {
			dirnames = dirnames[0:i]
		} else {
			dirnames = dirnames[0:i]
			break
		}
	}

	if len(dirnames) > 0 {
		return "/" + strings.Join(dirnames, "/") + "/"
	} else {
		return ""
	}
}

func IsNil(d interface{}) bool {
	if d == nil {
		return true
	}

	v := reflect.ValueOf(d)
	if !v.IsValid() {
		return true
	}

	k := v.Kind()
	switch k {
	case reflect.Chan, reflect.Func, reflect.Map, reflect.Ptr, reflect.Interface, reflect.Slice:
		if v.IsNil() {
			return true
		}
	}

	return false
}

func Round2(f float64, n int) float64 {
	floatStr := fmt.Sprintf("%."+strconv.Itoa(n)+"f", f)
	inst, _ := strconv.ParseFloat(floatStr, 64)
	return inst
}

func FindStrArray(arr []string, f string) int {
	for n, v := range arr {
		if v == f {
			return n
		}
	}
	return -1
}

func ReadBytes(reader io.Reader) []byte {
	var r = bufio.NewReader(reader)
	var chunks = make([]byte, 0)

	var buf = make([]byte, 4096)
	for {
		n, err := r.Read(buf)
		if err != nil && err != io.EOF {
			panic(err)
		}

		if 0 == n {
			break
		}

		chunks = append(chunks, buf[:n]...)
	}

	return chunks
}

func GetDeltaFileTmpDir() string {
	var tempDir = GetCurrPath() + KDeltaFilesDir + "/" + strconv.FormatInt(time.Now().UnixNano(), 16)
	os.Mkdir(tempDir, os.FileMode(0755))

	return tempDir
}

func GetDownloadFileTmpDir() string {
	var tempDir = GetCurrPath() + KDownloadFilesDir
	os.Mkdir(tempDir, os.FileMode(0755))

	return tempDir
}

func FileExist(filename string) bool {
	_, err := os.Stat(filename)
	return err == nil || os.IsExist(err)
}

func ZipFile(srcFilePath, destFilePath string) error {
	destFile, err := os.Create(destFilePath)
	if err != nil {
		return err
	}
	defer destFile.Close()

	zipit := zip.NewWriter(destFile)
	defer zipit.Close()

	srcFile, err := os.Open(srcFilePath)
	if err != nil {
		return err
	}
	defer srcFile.Close()

	// get the file information
	info, err := srcFile.Stat()
	if err != nil {
		return err
	}

	header, err := zip.FileInfoHeader(info)
	if err != nil {
		return err
	}

	header.Method = zip.Deflate

	writer, err := zipit.CreateHeader(header)
	if err != nil {
		return err
	}
	_, err = io.Copy(writer, srcFile)
	return err
}

func IsNotBlank(str string) bool {
	return strings.TrimSpace(str) != ""
}

func StrArrayContains(s []string, e string) (bool, int) {
	for i, a := range s {
		if a == e {
			return true, i
		}
	}
	return false, -1
}

func StrArrayDelete(ss []string, index int) []string {
	ss = append(ss[:index], ss[index+1:]...)
	return ss
}

func ObjContains(obj interface{}, target interface{}) (bool, error) {
	targetValue := reflect.ValueOf(target)
	switch reflect.TypeOf(target).Kind() {
	case reflect.Slice, reflect.Array:
		for i := 0; i < targetValue.Len(); i++ {
			if targetValue.Index(i).Interface() == obj {
				return true, nil
			}
		}
	case reflect.Map:
		if targetValue.MapIndex(reflect.ValueOf(obj)).IsValid() {
			return true, nil
		}
	}

	return false, errors.New("not in array")
}

func ToUrlPath(urlPath string) string {
	return strings.Replace(urlPath, string(filepath.Separator), "/", -1)
}

func ToFsPath(urlPath string) string {
	return strings.Replace(urlPath, "/", string(filepath.Separator), -1)
}

func GetRealPath(basePath, urlPath, name string) string {
	fsPath := ToFsPath(urlPath)
	realPath := filepath.Join(basePath, fsPath, name)

	return realPath
}
