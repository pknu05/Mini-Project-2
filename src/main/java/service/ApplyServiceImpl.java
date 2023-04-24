package service;

import java.util.List;

import config.MyBatisContext;
import dto.Apply;
import mapper.ApplyMapper;

public class ApplyServiceImpl implements ApplyService{

	@Override
	public int insertApply(Apply obj) {
		try {
			return MyBatisContext.getSqlSession().getMapper(ApplyMapper.class)
					.insertApply(obj);
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<Apply> selectApplyList(String id) {
		try {
			return MyBatisContext.getSqlSession().getMapper(ApplyMapper.class)
					.selectApplyList(id);
		}
		catch (Exception e) {
			e.printStackTrace();
		return null;
		}
	}

}
