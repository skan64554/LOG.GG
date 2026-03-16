package com.semi.spring.security.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/security")
@Controller
public class SecurityController {
	
	// 필드방식 의존성 주입
	//@Autowired
	private MemberService mService;
		
	//@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public SecurityController(MemberService mService, BCryptPasswordEncoder passwordEncoder) {
		this.mService = mService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@RequestMapping("/accessDenied")
	public String accessDenied(Model m) {
		m.addAttribute("errorMsg","접근 불가능한 페이지입니다.");
		return "common/errorPage";
	}
	
	@GetMapping("/mypage")
	public String myPage(
			Authentication auth ,
			Principal principal ,
			Model model) {
		
		
		
		
		return null;
	}
}
