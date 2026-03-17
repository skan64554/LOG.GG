package com.semi.spring.lol.controller;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.spring.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/lol")
@RequiredArgsConstructor
public class LolController {

	private final BoardService boardService;
	private final ResourceLoader resourceLoader;
	private final ServletContext application; // application scope
}
