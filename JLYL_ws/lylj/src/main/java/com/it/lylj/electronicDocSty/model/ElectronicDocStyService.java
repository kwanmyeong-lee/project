package com.it.lylj.electronicDocSty.model;

import java.util.List;

public interface ElectronicDocStyService {
	List<ElectronicDocStyVO> selectAll();
	ElectronicDocStyVO selectByStyleNo(String styleNo);
}
