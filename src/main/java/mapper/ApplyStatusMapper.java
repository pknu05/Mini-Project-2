package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Applystatus;

@Mapper
public interface ApplyStatusMapper {

	// insert, update, delete => int
	// select => list, object int ...다양함.
	
	// 가장 최근에 신청한 apply no 값을 받아오는 매퍼 -> MAX 함수 활용 조건으로 id
	@Select({
		" SELECT NVL(max(no),0) FROM apply b WHERE Memberid = #{Memberid} "
	})
	public long selectApplyMinOne(@Param("Memberid") String id);
	
	// 신청 상태 => 1. 결제 완료 / 2. 결제 취소 / 3. 참여 완료 
	@Insert({
		" INSERT INTO APPLYTATUS (applyno,chk) ",
		" value(#{obj.applyno},#{obj.chk})"
	})
	public int insertApplyStatus(@Param("obj") Applystatus obj);
	
	
}
