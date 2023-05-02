package service;

import java.util.List;

import dto.Activitycate;
import dto.Citycate;
import dto.Classproduct;

public interface ClassInsertService {
	// 1. 클래스 등록
	public int insertClassOne(Classproduct obj) throws Exception;

	// 2. 클래스 1개 조회
	public Classproduct selectClassOne(long classcode) throws Exception;

	// 3. 클래스 취소
	public int deleteClassOne(long classcode) throws Exception;

	// 4. 클래스 수정
	public int updateClassOne(Classproduct obj) throws Exception;
	
	// 5. 지역 상위 카테고리 조회
	public List<Citycate> selectCitycateList();
	
	// 6. 클래스 상위 카테고리 조회
	public List<Activitycate> selectActivitycateList();
	
	// 7. 내 클래스 관리
	public List<Classproduct> selectMyClassList(String id);
}
