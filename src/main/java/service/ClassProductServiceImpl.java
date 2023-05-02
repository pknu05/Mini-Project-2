package service;

import java.util.List;

import config.MyBatisContext;
import dto.ClassSessionView;
import dto.Classproduct;
import dto.Session;
import mapper.ClassProductMapper;

public class ClassProductServiceImpl implements ClassProductService {

	// try-catch 문 처리
	
	ClassProductMapper mapper = MyBatisContext.getSqlSession().getMapper(ClassProductMapper.class);
	
	@Override
	public List<ClassSessionView> selectClassSessionView(long classcode) {
		
		return mapper.selectClassSessionView(classcode);
	}

	@Override
	public Session selectSessionOne(long sessionno) {
		// TODO Auto-generated method stub
		return mapper.selectSessionOne(sessionno);
	}

	@Override
	public Classproduct selectClassproductOne(long classcode) {
		// TODO Auto-generated method stub
		return mapper.selectClassproductOne(classcode);
	}

}
