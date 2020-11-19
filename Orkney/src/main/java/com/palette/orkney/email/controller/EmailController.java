package com.palette.orkney.email.controller;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value="/transPw.do", method=RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {
 
//        String USERNAME = (String) paramMap.get("username");
		String USERNAME="이세현";
//        String EMAIL = (String) paramMap.get("email");
		String EMAIL="ul0426@naver.com";
//        String PASSWORD = "1111111111";
		
		String noticeEmail=
				"    <div style=\"width:100%;height:500px;min-height:500px;text-align: -webkit-center;\">\r\n" + 
				"      <div style=\"width:65%;height:100%;display:flex; flex-direction: column; justify-content: center; background-color:rgb(242, 245, 247);max-width:709px ;\">\r\n" + 
				"        <div style=\"width: 85%;height: 85%;align-self: center; background-color:white;padding:.5rem .8rem 0rem;text-align: -webkit-left;\">\r\n" + 
				"          <div style=\"text-align: -webkit-center;\">\r\n" + 
				"            <div style=\"background-image: url(https://kr.accounts.ikea.com/resources/static/logo.svg);\r\n" + 
				"          background-repeat: no-repeat;\r\n" + 
				"            background-size: 88px 44px;\r\n" + 
				"            content: '';\r\n" + 
				"            width:88px;\r\n" + 
				"            height:44px;\r\n" + 
				"            background-color:#0058a3;\"></div></div>\r\n" + 
				"          <br>\r\n" + 
				"        <div><h1 style=\"margin:0;\">안녕하세요.</h1></div>\r\n" + 
				"        <br>\r\n" + 
				"        <div style=\"height: 47%;\">비밀번호 변경을 요청하셨습니다.<br><br>\r\n" + 
				"          고객님께서 요청하시지 않았다면, 보안을 위해 IKEA 계정에 로그인하실 수 있는지 확인해 주세요.<br><br>          \r\n" + 
				"          비밀번호 변경을 요청하셨다면 아래 버튼을 눌러 비밀번호를 변경해주세요.</div>\r\n" + 
				"          <div style=\"text-align-last: center;\"><button style=\"padding: 15px 37px 35px; border:none;background-color:#0058a3;border-radius: 30px;color: white; font-weight: 700;\">비밀번호 변경</button></div>\r\n" + 
				"          <div><p>ORKNEY.KO</p></div>\r\n" + 
				"      </div>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
             
        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true,"UTF-8");
            messageHelper.setFrom("orkney@orkney.com");
            messageHelper.setSubject("ORKNEY 비밀번호 재설정");
            messageHelper.setText(noticeEmail,true);
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            e.printStackTrace();
        }
//        mv.setViewName("redirect:/emailSuccess");
        mv.setViewName("redirect:/member/memberLogin.do");
        return mv;
    }

}
