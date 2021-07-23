package com.it.lylj.assiduity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.attend.model.AttendService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
@RequiredArgsConstructor
public class AnnualController {
	private final AttendService attendService;
	
	
}
