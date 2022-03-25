package common

import (
	"os"
	"bytes"
	"compress/gzip"
	"io/ioutil"
	"archive/zip"
	"io"
	//"strings"
	"path/filepath"
	//"golang.org/x/text/encoding/simplifiedchinese"
	//"fmt"
	//"golang.org/x/text/transform"
	//"unicode/utf8"
	//"unicode/utf8"
)

func Compress(data []byte) []byte {
	if len(data) <= 0 {
		return nil
	}

	var buffer bytes.Buffer
	var writer = gzip.NewWriter(&buffer)
	defer writer.Close()

	writer.Write(data)
	writer.Flush()

	return buffer.Bytes()
}

func DeCompress(data []byte) []byte {
	if len(data) <= 0 {
		return nil
	}

	var buffer bytes.Buffer
	buffer.Write(data)

	var reader, _ = gzip.NewReader(&buffer)
	defer reader.Close()

	var result, _ = ioutil.ReadAll(reader)
	return result
}

//------------------------------------------------------------------------

func CompressFile(srcFile, destFile string) error {
	bytes, err := ioutil.ReadFile(srcFile)
	if err != nil {
		return err
	}

	var cbytes = Compress(bytes)
	return  ioutil.WriteFile(destFile, cbytes, os.ModePerm)
}

func DeCompressFile(srcFile, destFile string) error {
	bytes, err := ioutil.ReadFile(srcFile)
	if err != nil {
		return err
	}

	var dbytes = DeCompress(bytes)
	return ioutil.WriteFile(destFile, dbytes, os.ModePerm)
}


func DeCompressZip(zipFile, dest string) error {
	reader, err := zip.OpenReader(zipFile)
	if err != nil {
		return err
	}
	defer reader.Close()
	for _, file := range reader.File {
		rc, err := file.Open()
		if err != nil {
			return err
		}
		defer rc.Close()

		fileName,_ := GBK2UTF8([]byte(file.Name))
		filePath := filepath.Join(dest, string(fileName))

		if file.FileInfo().IsDir() {
			os.MkdirAll(filePath, file.Mode())
		} else {
			fileDir := filepath.Dir(filePath)
			err = os.MkdirAll(fileDir, 0755)
			if err != nil {
				return err
			}
			w, err := os.Create(filePath)
			if err != nil {
				//return err
				continue
			}
			defer w.Close()
			_, err = io.Copy(w, rc)
			if err != nil {
				return err
			}
			w.Close()
			rc.Close()
		}

	}
	return nil
}