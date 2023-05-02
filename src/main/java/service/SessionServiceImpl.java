package service;

import java.util.List;
import java.util.Map;

import dto.Session;

public class SessionServiceImpl implements SessionService{
	
	/* (1) 세션 등록*/
	@Override
	public int insertSessionOne(Session obj) throws Exception {
		return mapper.insertSessionOne(obj);
	}
	
	/* (1)-1 클래스 가격 조회 */
	@Override
	public long selectPriceOne(long classcode) throws Exception {
		return mapper.selectPriceOne(classcode);
	}
	
	/* (2) 세션 전체 조회 */
	@Override
	public List<Session> selectSessionList(long classcode) throws Exception {
		return mapper.selectSessionList(classcode);
	}
	
	/* (2)-1 세션 하나 조회 */
	@Override
	public Session selectSessionOne(Session obj) throws Exception {
		return mapper.selectSessionOne(obj);
	}
	
	/* (3) 세션 수정 */
	@Override
	public int updateSessionOne(Session obj) throws Exception {
		return mapper.updateSessionOne(obj);
	}
	
	/* (4) 세션 하나 삭제 */
	@Override
	public int deleteSessionOne(long no) throws Exception {
		return mapper.deleteSessionOne(no);
	}
	
	/* (5) 세션 목록 삭제 */
	@Override
	public int deleteSessionList(Map<String, Object> map) throws Exception {
		return mapper.deleteSessionList(map);
	}

	

	
	
	
	
	



	

	

}
