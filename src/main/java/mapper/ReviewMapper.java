package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.ClassSessionView;
import dto.Classproduct;
import dto.Review;
import dto.Session;

@Mapper
public interface ReviewMapper {
	
	// 클래스세션뷰 조회(클래스코드)
	@Select({
		" SELECT csv.* FROM CLASSSESSIONVIEW csv where CLASSCODE = #{classcode} "
		})
	public List<ClassSessionView> ClassSessionViewSelect(long classcode);
	
	@Select({
		" SELECT s.* FROM SESSION s where no = #{sessionno} "
		})
	public Session SelectSession(long sessionno);
	
	
	// 프로덕트 조회(클래스코드)
	@Select({
		" SELECT c.* FROM Classproduct c where CLASSCODE = #{classcode}"
		})
	public Classproduct SelectClassproduct(long classcode);
	
	@Insert({
		"INSERT INTO REVIEW (NO,TITLE, CONTENT, RATING)",
		"VALUES(#{obj.no},#{obj.title},#{obj.content},#{obj.rating})" 
		})
	public int insertReviewOne(@Param("obj") Review obj);

	
	@Select({
		" SELECT r.* FROM REVIEW r ;"
		})
	public List<Review> selectReviewAll();
	
	@Select({
		" SELECT r.* FROM REVIEW r ;"
		})
	public Review selectReviewOne();
	
	
	@Delete({
		" DELETE from REVIEW where no = ${no}"		
	})
	public int deleteReviewOne(long no);
	
}
