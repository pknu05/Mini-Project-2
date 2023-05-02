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
