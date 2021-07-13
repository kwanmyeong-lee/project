package com.it.lylj.index.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.index.model.IndexVO;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping("/index")
	public void test() {
		logger.info("메인 화면 보여주기");
		
	}

	@RequestMapping("/inc/organizationChart")
	public void organizationChart() {
		logger.info("메인 화면 보여주기");
		
	}
	
	@ResponseBody
	@RequestMapping("/inc/list")
	public String  list() {
		logger.info("메인 화면 보여주기");

		String vo = "[{\"id\":1,\"text\":\"Root node\",\"children\":[{\"id\":2,\"text\":\"Child node 1\"},{\"id\":3,\"text\":\"Child node 2\"}]}]";
		return vo;
	}
	
}

