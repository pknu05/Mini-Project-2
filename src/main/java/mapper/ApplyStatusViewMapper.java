package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.ApplyStatusView;

@Mapper
public interface ApplyStatusViewMapper {
	
	@Select({
		" SELECT * FROM APPLYSTATUSVIEW WHERE CLASSCODE=#{classcode} ORDER BY REGDATE DESC "
	})
	public List<ApplyStatusView> selectApplyStatusViewList(@Param("classcode") long classcode);
	
	@Select({
		" SELECT * FROM APPLYSTATUSVIEW WHERE memberid = #{id} ORDER BY regdate DESC "
	})
	public List<ApplyStatusView> selectApplyStatusViewListById(@Param("id") String id);

}