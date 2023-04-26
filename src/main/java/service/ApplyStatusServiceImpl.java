package service;

import config.MyBatisContext;
import dto.ApplyStatus;
import mapper.ApplyMapper;
import mapper.ApplyStatusMapper;

public class ApplyStatusServiceImpl implements ApplyStatusService{

	@Override
	public int insertApplyTatus(ApplyStatus obj) {
		try {
			return MyBatisContext.getSqlSession().getMapper(ApplyStatusMapper.class)
					.insertApplyStatus(obj);
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}

}
