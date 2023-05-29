package service;

import org.apache.ibatis.annotations.Param;

import dto.Member;

public interface MemberService {

	public int insertMemberOne(Member obj); 
	
	public int selectMemberIDCheck(String id);
	
	public Member selectMemberLogin(Member obj);
	
	public Member selectMemberOne(String obj);
	
	public Member findMemberId(Member obj);
	
	public int updateMemberOne(Member obj);
	
	public int updateMemberPassword(Member obj);
	
	public int deleteMemberOne(Member obj);


}
