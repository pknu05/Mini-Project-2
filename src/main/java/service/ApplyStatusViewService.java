package service;

import java.util.List;

import config.MyBatisContext;
import dto.ApplyStatusView;
import mapper.ApplyStatusViewMapper;

public interface ApplyStatusViewService {
	
	final ApplyStatusViewMapper mapper = MyBatisContext.getSqlSession().getMapper(ApplyStatusViewMapper.class);
	
	/* (1) 신청자관리 테이블 정보 조회 */
	public List<ApplyStatusView> selectApplyStatusViewList(long classcode) throws Exception;
	
	/* (2) 본인 신청 내역 정보 조회 */
	public List<ApplyStatusView> selectApplyStatusViewListById(String id) throws Exception;

}