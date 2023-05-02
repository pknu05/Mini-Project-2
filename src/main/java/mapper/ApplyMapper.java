package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Apply;
import dto.ClassSessionView;

@Mapper
public interface ApplyMapper {
	
	// insert, update, delete => int
	// select => list, object int ...다양함.
	
	
	// 수업 등록을 위한 값
	@Insert({
		" INSERT INTO Apply (person, memberid, sessionno)",
		" VALUES(#{obj.person}, #{obj.memberid}, #{obj.sessionno})"
	})
	public int insertApply(@Param("obj") Apply obj);
	
	// 등록한 것을 보기 위한 값
	@Select({
		"Select FROM Apply WHERE memberid=#{id} "
	})
	public List<Apply> selectApplyList(@Param("id") String id);
	
	// classsessionview 정보 하나 불러오기
	@Select({
		" SELECT a.cnt, a.maximum, a.totalprice FROM classsessionview a WHERE no = #{no} "
	})
	public ClassSessionView selectClassSessionViewOne(@Param("no") long sessionno);

}
