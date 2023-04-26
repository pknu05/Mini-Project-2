package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import config.MyBatisContext;
import dto.ApplyStatusView;
import mapper.ApplyStatusViewMapper;
import mapper.SessionMapper;

public interface ApplyStatusViewService {
	
	final ApplyStatusViewMapper mapper = MyBatisContext.getSqlSession().getMapper(ApplyStatusViewMapper.class);
	
	/* (1) 신청자관리 테이블 정보 조회 */
	public List<ApplyStatusView> selectApplyStatusViewList(@Param("classcode") long classcode) throws Exception;

}
