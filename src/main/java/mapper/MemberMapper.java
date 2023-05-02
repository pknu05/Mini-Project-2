package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Member;

@Mapper
public interface MemberMapper {
	// 회원가입
	@Insert({ " insert into member (id, password, name, email,phone,gender,birth) ",
			" values (#{obj.id},#{obj.password},#{obj.name},#{obj.email},#{obj.phone},#{obj.gender},#{obj.birth}) " })
	public int insertMemberOne(@Param("obj") Member obj);

	// 중복아이디확인
	@Select({ " select count(*) cnt from member m where id = #{id} " })
	public int selectMemberIDCheck(@Param("id") String id);

	// 로그인
	@Select({ " select * from member where id =#{obj.id} and password=#{obj.password} and chk = 1 "

	})
	public Member selectMemberLogin(@Param("obj") Member obj);

	// 회원조회
	@Select({ " select m.name, m.email, m.phone FROM member m where id =#{id} " })
	public Member selectMemberOne(@Param("id") String id);

	// 아이디찾기
	@Select({
			"select m.id from member m where name = #{obj.name} and phone =#{obj.phone} and email = #{obj.email} and chk = 1 "

	})
	public Member findMemberId(@Param("obj") Member obj);

	// 회원정보수정
	@Update({ "update member set name = #{obj.name},email = #{obj.email},phone = #{obj.phone} WHERE id = #{obj.id} " })
	public int updateMemberOne(@Param("obj") Member obj);

	// 비밀번호변경
	@Update({ "update member set password = #{obj.newpassword} where password =#{obj.password} " })
	public int updateMemberPassword(@Param("obj") Member obj);
	// 로그아웃

	// 회원탈퇴
	@Update({ "update member set chk = 0 where id= #{obj.id} and password =#{obj.password} "

	})
	public int deleteMemberOne(@Param("obj") Member obj);

}