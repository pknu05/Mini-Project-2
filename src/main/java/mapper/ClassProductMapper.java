package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import dto.ClassSessionView;
import dto.Classproduct;
import dto.Session;

@Mapper
public interface ClassProductMapper {
	
	// 클래스세션뷰 조회(클래스코드)
	@Select({
		" SELECT csv.* FROM CLASSSESSIONVIEW csv where CLASSCODE = #{classcode} "
		})
	public List<ClassSessionView> selectClassSessionView(long classcode);
	
	@Select({
		" SELECT s.* FROM SESSION s where no = #{sessionno} "
		})
	public Session selectSessionOne(long sessionno);
	
	
	// 프로덕트 조회(클래스코드)
	@Select({
		" SELECT c.* FROM Classproduct c where CLASSCODE = #{classcode}"
		})
	public Classproduct selectClassproductOne(long classcode);

}
