package service;

import java.util.List;

import config.MyBatisContext;
import dto.Activitycate;
import dto.Citycate;
import dto.Classproduct;
import mapper.ClassMapper;

public class ClassInsertServiceImpl implements ClassInsertService {

	ClassMapper cMapper = MyBatisContext.getSqlSession().getMapper(ClassMapper.class);
	
	@Override
	public int insertClassOne(Classproduct obj) throws Exception {
		
		System.out.println(obj.getAddress1());
		
		return cMapper.insertClassOne(obj);
		
	}

	@Override
	public Classproduct selectClassOne(long classcode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteClassOne(long classcode) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateClassOne(Classproduct obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Citycate> selectCitycateList() {
		return cMapper.selectCitycateList();
	}

	@Override
	public List<Activitycate> selectActivitycateList() {
		return cMapper.selectActivitycateList();
	}

	@Override
	public List<Classproduct> selectMyClassList(String id) {
		System.out.println(id);
		System.out.println(cMapper.selectMyClassList(id).toString());
		return cMapper.selectMyClassList(id);
	}

}
