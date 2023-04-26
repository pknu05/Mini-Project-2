package service;

import java.util.List;

import dto.ApplyStatusView;
import mapper.ApplyStatusViewMapper;

public class ApplyStatusViewServiceImpl implements ApplyStatusViewService{

	@Override
	public List<ApplyStatusView> selectApplyStatusViewList(long classcode) throws Exception {
		return mapper.selectApplyStatusViewList(classcode);
	}

	
	

}
