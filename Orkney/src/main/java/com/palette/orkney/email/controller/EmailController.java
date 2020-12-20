package com.palette.orkney.email.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("key")
public class EmailController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value="/transPw.do", method=RequestMethod.POST)
    public ModelAndView sendEmailAction (@RequestParam(value="email") String email, ModelMap model, ModelAndView mv,HttpServletResponse response) throws Exception {
 
//        String USERNAME = (String) paramMap.get("username");
		//String USERNAME="이세현";
//        String EMAIL = (String) paramMap.get("email");
		String EMAIL=email;
		mv.addObject("ani","true");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 20; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		
		String key=temp.toString();
		
		Cookie c=new Cookie("trans",key);
		c.setMaxAge(60*60*60*60);
		c.setPath("/");
		response.addCookie(c);
		
		
		
		System.out.println(email);
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
				"          <div style=\"text-align-last: center;\"><a target='_blank'"
				+ "href='http://localhost:9090/orkney/member/transPassword.do?id="+email+"&key="+key+"' style=\"padding: 18px 37px 24px; border:none;background-color:#0058a3;border-radius: 30px;color: white; font-weight: 700;\">비밀번호 변경</a></div>\r\n" + 
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
        mv.setViewName("/member/login");
        
        return mv;
    }
	
	
	@RequestMapping("/hy/sendMail.do")
	public String sendMail() {
		
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
				"          <div style=\"text-align-last: center;\"><a target='_blank'"
				+ "href='http://localhost:9090/orkney' style=\"padding: 18px 37px 24px; border:none;background-color:#0058a3;border-radius: 30px;color: white; font-weight: 700;\">비밀번호 변경</a></div>\r\n" + 
				"          <div><p>ORKNEY.KO</p></div>\r\n" +
				"      </div>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
             
        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true,"UTF-8");
            messageHelper.setFrom("ckfEhrlEHrl@gmail.com");
            messageHelper.setSubject("ORKNEY 비밀번호 재설정");
            messageHelper.setText(noticeEmail,true);
            InternetAddress[] toAddr = new InternetAddress[2];
            toAddr[0] = new InternetAddress("dlgkdud7845@naver.com");
            toAddr[1] = new InternetAddress("tkdgur1239@naver.com");
            messageHelper.setTo(toAddr);
            msg.setRecipients(MimeMessage.RecipientType.TO , toAddr);
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            e.printStackTrace();
        }
		
		
		return "";
	}
	
	
	

	@RequestMapping(value="/member/emailAuth.do", method=RequestMethod.POST)//가입시 이메일 인증
    public String emailAuth(@RequestParam Map userInfo,Model m,HttpServletResponse response,HttpSession session) throws Exception {
		
		String email=(String)userInfo.get("email");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 6; i++) {//인증번호
		        temp.append((rnd.nextInt(10)));
		    }
		String key=temp.toString();
		System.out.println(key);
		userInfo.put("key",key);
		userInfo.put("auth","N");
		session.setAttribute("userInfo",userInfo);
//		m.addAttribute("userInfo",userInfo);
//		m.addAttribute("key",key);
		
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
				"        <div style=\"height: 47%;\">인증 번호를 요청하셨습니다.<br><br>\r\n" + 
				"          고객님께서 요청하시지 않았다면, 보안을 위해 IKEA 계정에 로그인하실 수 있는지 확인해 주세요.<br><br>          \r\n" + 
				"          페이지에서 인증 번호를 입력해주세요.<p>"+key+"</p></div>\r\n" + 
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
            messageHelper.setSubject("ORKNEY 인증번호 확인");
            messageHelper.setText(noticeEmail,true);
            messageHelper.setTo(email);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email));
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            e.printStackTrace();
        }
        
        

        
        return "redirect:emailPage.do";
    }
	
	@RequestMapping(value="/orderAllow.do")
	@ResponseBody
    public String sendOrderAllow (Map info) throws Exception {
		
		String no=(String)info.get("no");
		String EMAIL=(String)info.get("email");
		String name=(String)info.get("name");
		String state=(String)info.get("state");
		
		System.out.println(EMAIL);
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
				"        <div><h1 style=\"margin:0;\">Hej"+name+"</h1></div>\r\n" + 
				"        <br>\r\n" + 
				"        <div style=\"height: 47%;\">고객님의 주문 '"+no+"'이 변경되어 안내 메일을 발송해드립니다.<br><br>\r\n" + 
				"          본 메일은 자동 발송 메일로, 주문이 "+state+" 되었음을 알려드립니다.<br><br>          \r\n" + 
				"          궁금한하신 사항이 있거나 또는 배송 현황을 확인하시려면은 <a target='_blank' href='http://localhost:9090/orkney'>IKEA.com</a> 에서을</div>\r\n" +
				"          방문 확인하시거나 IKEA 고객지원센터(1670-4532) 또는 <a target='_blank' href='#'>Contact Us</a> 으로 연락</div>\r\n" +
				"          해 주시기 바랍니다.</div>\r\n" +
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
            messageHelper.setSubject("ORKNEY 주문변경 승인 안내");
            messageHelper.setText(noticeEmail,true);
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            e.printStackTrace();
        }
        return "이메일 전송완료";
    }

}
