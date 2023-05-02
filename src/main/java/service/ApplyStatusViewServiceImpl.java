package service;

import java.util.List;

import config.MyBatisContext;
import dto.ApplyStatusView;
import mapper.ApplyStatusViewMapper;

public class ApplyStatusViewServiceImpl implements ApplyStatusViewService{

	ApplyStatusViewMapper mapper = MyBatisContext.getSqlSession().getMapper(ApplyStatusViewMapper.class);
	
	@Override
	public List<ApplyStatusView> selectApplyStatusViewList(long classcode) throws Exception {
		return mapper.selectApplyStatusViewList(classcode);
	}

	@Override
	public List<ApplyStatusView> selectApplyStatusViewListById(String id) throws Exception {
		return mapper.selectApplyStatusViewListById(id);
	}

}