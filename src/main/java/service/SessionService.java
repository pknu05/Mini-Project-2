package service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import config.MyBatisContext;
import dto.Session;
import mapper.SessionMapper;

public interface SessionService {
	
	final SessionMapper mapper = MyBatisContext.getSqlSession().getMapper(SessionMapper.class);
	
	/* (1) 세션 등록*/
	public int insertSessionOne(@Param("obj") Session obj) throws Exception;
	
	/* (1)-1 클래스 가격 조회 */
	public long selectPriceOne(@Param("classcode") long classcode) throws Exception; 
	
	/* (2) 세션 전체 조회 */
	public List<Session> selectSessionList(@Param("classcode") long classcode) throws Exception;
	
	/* (2)-1 세션 하나 조회 */
	public Session selectSessionOne(@Param("obj") Session obj) throws Exception;
	
	/* (3) 세션 수정 */
	public int updateSessionOne(@Param("obj") Session obj) throws Exception;
	
	/* (4) 세션 하나 삭제 */
	public int deleteSessionOne(@Param("no") long no) throws Exception;
	
	/* (5) 세션 목록 삭제 */
	public int deleteSessionList(@Param("map") Map<String, Object> map) throws Exception;
	
}
