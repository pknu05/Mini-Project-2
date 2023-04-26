package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.ApplyStatusView;

@Mapper
public interface ApplyStatusViewMapper {
	
	@Select({
		" SELECT * FROM APPLYSTATUSVIEW WHERE CLASSCODE=#{obj.classcode} ORDER BY REGDATE DESC "
	})
	public List<ApplyStatusViewMapper> selectApplyStatusViewList(@Param("obj") ApplyStatusView obj);

}
