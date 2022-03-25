package common

import (
	"fmt"
	"strings"

	"github.com/astaxie/beego"
	"github.com/liumingmin/decoratecloud/common/ismtp"
)

var gEmailInit bool = false
var gSmtpHost string
var gSmtpPort string
var gSmtpUser string
var gSmtpPassword string
var gSmtpSender string

func initEmail() {
	if !gEmailInit {
		gSmtpHost = beego.AppConfig.String("mail.smtp.host")
		gSmtpPort = beego.AppConfig.String("mail.smtp.port")
		gSmtpUser = beego.AppConfig.String("mail.sender.account")
		gSmtpPassword = beego.AppConfig.String("mail.sender.password")
		gSmtpSender = beego.AppConfig.String("mail.sender.from")

		gEmailInit = true
	}
}

func SendEmail(receivers []string, subject string, body string) bool {
	initEmail()

	emailauth := ismtp.LoginAuth(
		gSmtpUser,
		gSmtpPassword,
		gSmtpHost,
	)

	ctype := fmt.Sprintf("Content-Type: %s; charset=%s", "text/plain", "utf-8")

	msg := fmt.Sprintf("To: %s\r\nCc: %s\r\nFrom: %s\r\nSubject: %s\r\n%s\r\n\r\n%s",
		strings.Join(receivers, ";"),
		"",
		gSmtpSender,
		subject,
		ctype,
		body)

	err := ismtp.SendMail(gSmtpHost+":"+gSmtpPort, //convert port number from int to string
		emailauth,
		gSmtpSender,
		receivers,
		[]byte(msg),
	)

	if err != nil {
		beego.BeeLogger.Error("email.SendEmail@smtp.SendMail(): err=%v", err)
		return false
	}

	return true
}
