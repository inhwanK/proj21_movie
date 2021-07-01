package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import proj21_movie.dto.Admin;
import proj21_movie.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;

	// 관리자 페이지는 MovieManagerController 로 연결되어있으니 로그인시 페이지 넘어가는것만 구현
	
    //view에서 login_check.do를 맵핑하면 이 메소드가 호출된다. 
//    @RequestMapping("login")
    public ModelAndView login_check(Admin admin, HttpSession session, ModelAndView mav) {
    	
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + admin);
    	
        Admin admId = adService.getAdmin(admin);
        if(admId != null) { //로그인 성공 

            session.setAttribute("admId", admin.getAdmId());
            session.setAttribute("admId", admId);

            session.setAttribute("admId", admin.getAdmId());
            session.setAttribute("admId", admId);
            
            mav.setViewName("manager/movieManager"); //admin페이지를 보여준다는 뜻
            mav.addObject("message", "success");
        }else {
            
            mav.setViewName("login/login");    //관리자 로그인이 실패했을때 보여주는 페이지
            mav.addObject("message", "error");  
        }
        return mav; 
    }
        
    //관리자 로그아웃 처리
    //View에 있는 logout.do를 맵핑
    @RequestMapping("logout.do")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/main";
    }
}
