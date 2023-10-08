package com.ispan.eeit69.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit69.dao.impl.BusinessUsersRepository;
import com.ispan.eeit69.model.BusinessInformationForm;

@Controller
public class PageController {
	
	@GetMapping("/index.html")
	public String toJumpPageIndex() {
		System.out.println("跳转页面index");
		return "index";
	}
	
	@GetMapping("/index")
	public String toJumpPageIndexJSP() {
		System.out.println("跳转页面index");
		return "index";
	}

	@GetMapping("/login.html")
	public String toJumpPageLogin() {
		System.out.println("跳转页面login");
		return "login";
	}
	
	@GetMapping("/loginOk")
	public String toJumpPageLoginOk() {
		System.out.println("跳转页面login");
		return "loginOk";
	}

	@GetMapping("/contact.html")
	public String toJumpPageContact() {
		System.out.println("跳转页面contact");
		return "contact";
	}

	@GetMapping("/OderSystem.html")
	public String toJumpPageOderSystem() {
		System.out.println("跳转页面OderSystem");
		return "OderSystem";
	}

	@GetMapping("/plan.html")
	public String toJumpPagePlan() {
		System.out.println("跳转页面");
		return "plan";
	}

	@GetMapping("/Report.html")
	public String toJumpPageReport() {
		System.out.println("跳转页面");
		return "Report";
	}

	@GetMapping("/register")
	public String toJumpPageregister() {
		System.out.println("跳转页面");
		return "register";
	}
	
	@GetMapping("/registerOk")
	public String toJumpPageregisterOk() {
		System.out.println("跳转registerOk页面");
		    return "registerOk";
	}
	
	@GetMapping("/EnterInvitationCode")
	public String toJumpPageEnterInvitationCode() {
		System.out.println("跳转EnterInvitationCode页面");
		return "EnterInvitationCode";
	}
	
	@GetMapping("/BusinessInformation")
	public String toJumpPageBusinessInformation(HttpSession session) {
		System.out.println("跳转BusinessInformation页面");
		Object levelObject = session.getAttribute("level");
		if (levelObject != null) {
			String level = levelObject.toString();
			if ("A".equals(level)) {
				return "BusinessInformation";
			}
		}
		return "login";
	}
	
}