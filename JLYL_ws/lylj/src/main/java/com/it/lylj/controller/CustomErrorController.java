package com.it.lylj.controller;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.index.Controller.IndexController;


@Controller
public class CustomErrorController implements ErrorController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	// 에러 페이지 정의 
	private final String ERROR_404_PAGE_PATH = "error/404"; 
	private final String ERROR_500_PAGE_PATH = "error/500"; 
	private final String ERROR_ETC_PAGE_PATH = "error/error";
	@RequestMapping("/errors") 
	public String handleError(HttpServletRequest request, Model model) { 
		// 에러 코드를 획득한다. 
		logger.info("asd");
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE); 
		// 에러 코드에 대한 상태 정보 
		HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString())); 
		if (status != null) { 
			int statusCode = Integer.valueOf(status.toString()); 
			if (statusCode == HttpStatus.NOT_FOUND.value()) { 
				// 에러 페이지에 표시할 정보 
				model.addAttribute("code", status.toString()); 
				model.addAttribute("msg", httpStatus.getReasonPhrase()); 
				model.addAttribute("timestamp", new Date()); 
				return ERROR_404_PAGE_PATH; 
			} 
			if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) { 
				return ERROR_500_PAGE_PATH; 
			} 
		} 
		return ERROR_ETC_PAGE_PATH; 
	}
}
		


