package service;

import java.util.List;

import dto.Activitycate;
import dto.Citycate;

public interface ClassSelectService {
	
	// 1. 지역 상위 카테고리 전달
	public List<Citycate> classCitycateList();
	
	// 2. 클래스 상위 카테고리 전달
	public List<Activitycate> classActivitycateList();

}
