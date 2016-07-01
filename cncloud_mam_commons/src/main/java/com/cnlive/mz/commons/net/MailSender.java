package com.cnlive.mz.commons.net;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class MailSender {
	public static void main(String[] args) {
		MailSender mailSender = new MailSender();
		 
			mailSender.sendMail("ljc521521@126.com", "sdf", "【直播活动通知单】" );
	}
	
	// 收件人邮箱地址
	private String to;
	// 发件人邮箱地址
	private String from;
	// SMTP服务器地址
	private String smtpServer;
	// 登录SMTP服务器的用户名
	private String username;
	// 登录SMTP服务器的密码
	private String password;
	// 邮件主题
	private String subject;
	// 邮件正文
	private String content;
	// 记录所有附件文件的集合
	List<String> attachments = new ArrayList<String>();

	// 无参数的构造器
	public MailSender() {
	}

	public MailSender(String to, String from, String smtpServer, String username, String password, String subject,
			String content) {
		this.to = to;
		this.from = from;
		this.smtpServer = smtpServer;
		this.username = username;
		this.password = password;
		this.subject = subject;
		this.content = content;
	}

	// to属性的setter方法
	public void setTo(String to) {
		this.to = to;
	}

	// from属性的setter方法
	public void setFrom(String from) {
		this.from = from;
	}

	// smtpServer属性的setter方法
	public void setSmtpServer(String smtpServer) {
		this.smtpServer = smtpServer;
	}

	// username属性的setter方法
	public void setUsername(String username) {
		this.username = username;
	}

	// password属性的setter方法
	public void setPassword(String password) {
		this.password = password;
	}

	// subject属性的setter方法
	public void setSubject(String subject) {
		this.subject = subject;
	}

	// content属性的setter方法
	public void setContent(String content) {
		this.content = content;
	}

	// 把邮件主题转换为中文
	public String transferChinese(String strText) {
		try {
			strText = MimeUtility.encodeText(new String(strText.getBytes(), "GB2312"), "GB2312", "B");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strText;
	}

	// 增加附件，将附件文件名添加的List集合中
	public void attachfile(String fname) {
		attachments.add(fname);
	}

	// 发送邮件
	public boolean send() {
		Properties props = new Properties();
		props.put("mail.smtp.host", smtpServer);
		props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] addresses = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, addresses);
			subject = transferChinese(subject);
			msg.setSubject(subject);
			Multipart mp = new MimeMultipart();
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent(content, "text/html;charset = gbk");
			mp.addBodyPart(mbpContent);
			for (String efile : attachments) {
				MimeBodyPart mbpFile = new MimeBodyPart();
				FileDataSource fds = new FileDataSource(efile);
				mbpFile.setDataHandler(new DataHandler(fds));
				mbpFile.setFileName(fds.getName());
				mp.addBodyPart(mbpFile);
			}
			attachments.clear();
			msg.setContent(mp);
			msg.setSentDate(new Date());
			Transport.send(msg);
		} catch (MessagingException mex) {
			mex.printStackTrace();
			return false;
		}
		return true;
	}

	public void sendMail(String userNames, String message, String title) {
		this.setSmtpServer("mail.cnlive.com");
		this.setUsername("liujicheng");
		this.setPassword("CNljc12#$");
		this.setTo(userNames);
		this.setFrom("liujicheng@cnlive.com");
		this.setSubject(title);
		this.setContent(message);
		this.send();
	}
}