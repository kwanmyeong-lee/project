package com.it.lylj.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.ExcelReadOption;
import com.it.lylj.common.ExcelUtil;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/upload")
public class ExcelUploadController {
	
	@PostMapping("/read")
	@ResponseBody
	public List<Map<String,String>> excelUploadRead(MultipartHttpServletRequest multiRequest){
		MultipartFile excelFile= multiRequest.getFile("excelFile");
		File destFile = new File(ConstUtil.EXCELFILE_UPLOAD_PATH_REAL+"\\"+excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H");
		excelReadOption.setStartRow(2);
		List<Map<String,String>> excelContent = ExcelUtil.excelRead(excelReadOption);
		return excelContent;
	}
}
