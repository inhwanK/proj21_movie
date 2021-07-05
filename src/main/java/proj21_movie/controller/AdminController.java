package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.Admin;
import proj21_movie.dto.LoginCommand;
import proj21_movie.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;

	// 관리자 페이지는 MovieManagerController 로 연결되어있으니 로그인시 페이지 넘어가는것만 구현
	// 로그인 화면 연결(성공)
	@RequestMapping("/adminlogin")
	public String login() {
		return "admin/adminlogin";
	}
	
    //view에서 login_check.do를 맵핑하면 이 메소드가 호출된다. 
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public String loginPOST(LoginCommand loginCommand, HttpServletRequest request, Admin admin, 
			RedirectAttributes rttr, HttpServletResponse response) throws Exception {

		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + admin);

		HttpSession session = request.getSession();
		Admin adm = adService.getAdmin(admin);
		
		if (adm == null) { // 일치하지 않는 아이디, 비밀번호를 입력한 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/adminlogin";
		}   
		
        //로그인 성공
		session.setAttribute("admin", adm); // 일치하는 아이디, 비밀번호를 입력한 경우 (로그인 성공)
		
		return "redirect:/main";
	}
}
