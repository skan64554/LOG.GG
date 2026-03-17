package com.semi.spring.board.controller;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.spring.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;
	private final ResourceLoader resourceLoader;
	private final ServletContext application; // application scope
}
