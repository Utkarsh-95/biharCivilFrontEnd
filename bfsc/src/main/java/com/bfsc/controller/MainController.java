package com.bfsc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	/*@RequestMapping("/index")
	public ModelAndView root() {
		return new ModelAndView("index");
	}*/
	
	@RequestMapping("/login")
	public ModelAndView loginPage(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		SecurityContextHolder.clearContext();
		if(session != null) {
			session.invalidate();
		}
		
		return new ModelAndView("login");
	}

	@PostMapping("/login?logout")
	public ModelAndView logoutPage() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboard() {
		return new ModelAndView("dashboard");
	}

	@RequestMapping("/recoverpasswords")
	public ModelAndView recoverpasswords() {
		return new ModelAndView("recoverpasswords");
	}

	@GetMapping("/error")
	public ModelAndView error() {
		return new ModelAndView("error");
	}
	
	@RequestMapping("/devicemanagement")
	public ModelAndView devicemanagement() {
		return new ModelAndView("devicemanagement");
	}
	
	@RequestMapping("/vehiclemanagement")
	public ModelAndView vehiclemanagement() {
		return new ModelAndView("vehiclemanagement");
	}
	
	@RequestMapping("/dashblock1")
	public ModelAndView dashblock1() {
		return new ModelAndView("dashblock1");
	}
	
	@RequestMapping("/dashblock2")
	public ModelAndView dashblock2() {
		return new ModelAndView("dashblock2");
	}
	
	@RequestMapping("/dashblock3")
	public ModelAndView dashblock3() {
		return new ModelAndView("dashblock3");
	}
	
	@RequestMapping("/dashblock4")
	public ModelAndView dashblock4() {
		return new ModelAndView("dashblock4");
	}
	
	@RequestMapping("/admin/adddevice")
	public ModelAndView adddevice() {
		return new ModelAndView("adddevice");
	}
	
	@RequestMapping("/admin/addvehicle")
	public ModelAndView addvehicle() {
		return new ModelAndView("addvehicle");
	}
	
	@RequestMapping("/devicevehiclemanagement")
	public ModelAndView devicevehiclemanagement() {
		return new ModelAndView("devicevehiclemanagement");
	}
	
	@RequestMapping("/devicevehiclemanagementdetails")
	public ModelAndView devicevehiclemanagementdetails() {
		return new ModelAndView("devicevehiclemanagementdetails");
	}
	
	@RequestMapping("/alertnotify")
	public ModelAndView alertnotify() {
		return new ModelAndView("alertnotify");
	}
	
	@RequestMapping("/admin/usermanagement")
	public ModelAndView usermanagement() {
		return new ModelAndView("usermanagement");
	}
	
	@RequestMapping("/admin/usermanagementview")
	public ModelAndView usermanagementview() {
		return new ModelAndView("usermanagementview");
	}

}
