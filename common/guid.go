package common

import (
	"os"
	"io"
	"time"
	"crypto/md5"
	"crypto/rand"
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"sync/atomic"
)

var gGuidInit bool = false
var gMachineId  []byte
var gObjectIdCounter uint32

func initGuid(){
	if !gGuidInit {
		gMachineId = readMachineId()
		gObjectIdCounter = 0

		gGuidInit = true;
	}
}

func readMachineId() []byte {
	var sum [3]byte
	id := sum[:]
	hostname, err1 := os.Hostname()
	if err1 != nil {
		_, err2 := io.ReadFull(rand.Reader, id)
		if err2 != nil {
			panic(fmt.Errorf("cannot get hostname: %v; %v", err1, err2))
		}
		return id
	}
	hw := md5.New()
	hw.Write([]byte(hostname))
	copy(id, hw.Sum(nil))
	//fmt.Println("readMachineId:" + string(id))
	return id
}

func NewGuid() string  {
	initGuid()

	var b [12]byte
	// Timestamp, 4 bytes, big endian
	binary.BigEndian.PutUint32(b[:], uint32(time.Now().Unix()))
	// Machine, first 3 bytes of md5(hostname)
	b[4] = gMachineId[0]
	b[5] = gMachineId[1]
	b[6] = gMachineId[2]
	// Pid, 2 bytes, specs don't specify endianness, but we use big endian.
	pid := os.Getpid()
	b[7] = byte(pid >> 8)
	b[8] = byte(pid)
	// Increment, 3 bytes, big endian
	i := atomic.AddUint32(&gObjectIdCounter, 1)
	b[9] = byte(i >> 16)
	b[10] = byte(i >> 8)
	b[11] = byte(i)

	return hex.EncodeToString([]byte(string(b[:])))
}