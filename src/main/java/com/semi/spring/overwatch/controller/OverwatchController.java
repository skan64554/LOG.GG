package com.semi.spring.overwatch.controller;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.spring.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/overwatch")
@RequiredArgsConstructor
public class OverwatchController {

	private final BoardService boardService;
	private final ResourceLoader resourceLoader;
	private final ServletContext application; // application scope
}
