package common

import (
	"bytes"
	"crypto/cipher"
	"crypto/des"
	"encoding/base64"
	"crypto/sha256"
    "crypto/md5"
)

func DesEncrypt(data, key string) (string, error) {
	keyBytes := []byte(key)
	block, err := des.NewCipher(keyBytes)
	if err != nil {
		return "", err
	}

	dataBytes := []byte(data)
	dataBytes = PKCS5Padding(dataBytes, block.BlockSize())
	blockMode := cipher.NewCBCEncrypter(block, keyBytes)

	resBytes := make([]byte, len(dataBytes))
	blockMode.CryptBlocks(resBytes, dataBytes)

	result := base64.StdEncoding.EncodeToString(resBytes)
	return result, nil
}

func DesDecrypt(data, key string) (string, error) {
	keyBytes := []byte(key)
	block, err := des.NewCipher(keyBytes)
	if err != nil {
		return "", err
	}

	dataBytes, err2 := base64.StdEncoding.DecodeString(data)
	if err2 != nil {
		return "", err2
	}

	blockMode := cipher.NewCBCDecrypter(block, keyBytes)
	result := make([]byte, len(dataBytes))

	blockMode.CryptBlocks(result, dataBytes)
	result = PKCS5UnPadding(result)

	return string(result), nil
}

func PKCS5Padding(ciphertext []byte, blockSize int) []byte {
	padding := blockSize - len(ciphertext)%blockSize
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(ciphertext, padtext...)
}

func PKCS5UnPadding(origData []byte) []byte {
	length := len(origData)
	// 去掉最后一个字节 unpadding 次
	unpadding := int(origData[length-1])
	return origData[:(length - unpadding)]
}

func Md5HashEncrypt(password string, salt string) string{
	hash := md5.New()
	hash.Write([]byte(password +"&"+ salt))
	md := hash.Sum(nil)
	return base64.StdEncoding.EncodeToString(md)
}

func Md5Hash(content string) string{
	hash := md5.New()
	hash.Write([]byte(content))
	md := hash.Sum(nil)
	return base64.StdEncoding.EncodeToString(md)
}

func Sha256HashEncrypt(password string, salt string) string{
	hash := sha256.New()
	hash.Write([]byte(password +"&"+ salt))
	md := hash.Sum(nil)
	return base64.StdEncoding.EncodeToString(md)
}