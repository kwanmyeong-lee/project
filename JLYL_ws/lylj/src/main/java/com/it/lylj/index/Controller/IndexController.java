package com.it.lylj.index.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;
import com.it.lylj.index.model.OriVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private final EmpService empService;



	@RequestMapping("/inc/organizationChart")
	public void organizationChart() {
		logger.info("메인 화면 보여주기");

	}
	
	@RequestMapping("/index")
    public void test(HttpServletRequest req) {
        HttpSession session = req.getSession();

        session.setAttribute("empNo", 1);

    }

//	@ResponseBody
//	@RequestMapping("/inc/list")
//	public String  list() {
//		logger.info("메인 화면 보여주기");
//
//		String vo = "[{\"id\":1,\"text\":\"Root node\",\"children\":[{\"id\":2,\"text\":\"Child node 1\"},{\"id\":3,\"text\":\"Child node 2\"}]}]";
//		
//		return vo;
//	}

	@ResponseBody
	@RequestMapping("/inc/list")
	public List<OriVo> selectOri() {
		logger.info("메인 화면 보여주기");

		List<EmpVO> list = empService.selectAllEmp();

		List<OriVo> alist = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {
			
			EmpVO empVo = list.get(i);
			OriVo orivo = new OriVo();
			orivo.setId(Integer.toString(empVo.getDepartmentNo()));
			orivo.setText(empVo.getEmpName());
//			orivo.setParent(Integer.toString(empVo.getDepartmentNo()));
			
			alist.add(orivo);
		}
		
		return alist;

	}

}




















