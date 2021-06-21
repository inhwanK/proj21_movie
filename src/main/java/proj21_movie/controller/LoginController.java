package proj21_movie.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import proj21_movie.dto.AuthInfo;
import proj21_movie.dto.LoginCommand;
import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.exception.WrongIdPasswordException;
import proj21_movie.service.AuthService;
import proj21_movie.service.LoginService;
import proj21_movie.service.MemberService;
import proj21_movie.service.impl.MemberServiceImpl;
import proj21_movie.validator.LoginCommandValidator;

@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberServiceImpl service;
	
    @Autowired
    private AuthService authService;
    
    @Autowired
    private LoginService logService;

	// 로그인 화면 연결(성공)
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	// 임시 로그인성공 화면 연결(성공)
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "login/loginSuccess";
	}
	
	//임시 로그인실패(성공)
	@RequestMapping("/loginfail")
	public String loginfail() {
		return "login/loginfail";
	}

	// 로그인...(안되고있음)
    @GetMapping
    public String form(LoginCommand loginCommand, @CookieValue(value="REMEMBER", required = false) Cookie rCookie) {
    	if (rCookie != null) {
            loginCommand.setMemEmail(rCookie.getValue());
            loginCommand.setRememEmail(true);
        }

        return "/login/login";
    }

    @ResponseBody
    @RequestMapping(value = "submit.do", method = RequestMethod.POST)
    public String submit(@Param("memEmail") String memEmail, @Param("memPasswd") String memPasswd,@ModelAttribute LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
        new LoginCommandValidator().validate(loginCommand, errors);
        if (errors.hasErrors())
            return "/login/login";
        try {
        	//로그인 정보
        	RegisterRequest regireq =logService.regireqt(memEmail, memPasswd);
			System.out.println("#memEmail > " + memEmail);
			System.out.println("#memPasswd > " + memPasswd);
			
			Member member =memberService.selectMemberBymemEmail(memEmail);
			
			if(regireq == null) {
				System.out.println(regireq);
				throw new WrongIdPasswordException();
			}

            AuthInfo authInfo = authService.authenicate(loginCommand.getMemEmail(), loginCommand.getMemPasswd());
            session.setAttribute("authInfo", authInfo);
            
            Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getMemEmail());
            rememberCookie.setPath("/");
            if (loginCommand.isRememEmail()) {
                rememberCookie.setMaxAge(60 * 60 * 24 * 7);
            }else {
                rememberCookie.setMaxAge(0);
            }
            response.addCookie(rememberCookie);

            
            return "/login/loginSuccess";
        }catch (WrongIdPasswordException ex) {
            errors.reject("idPasswordNotMatching");
            return "/login/login";
        }
    }

}
