package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Classimage;

@Mapper
public interface ClassImageMapper {

	// 이미지1개 등록페이지
	@Insert({ 
		" INSERT INTO classimage(filename, filesize, filetype, filedata, typechk, classcode) ",
		" VALUES (#{obj.filename}, #{obj.filesize}, #{obj.filetype}, #{obj.filedata}, #{obj.typechk}, #{obj.classcode})" 
	})
	public int insertImageOne(@Param("obj") Classimage obj);

	// 이미지1개 조회페이지
	@Select({ 
		" SELECT ci.* FROM classimage ci WHERE NO=#{no} " 
		
	})
	public Classimage selectImageOne(@Param("no") long no); // 이미지 번호

	// 이미지 보기 페이지
	@Select({ 
		" SELECT ci.NO FROM classimage ci WHERE classcode=#{classcode} ORDER BY no DESC " 
		
	})
	public List<Long> insertClassImageOne(@Param("classcode") long classcode);

	// 이미지 1개 삭제 페이지
	@Delete({ 
		" DELETE FROM classimage WHERE NO=#{no}" 
		
	})
	public int deleteImageOne(@Param("no") long no);

	// 이미지 1개 변경 페이지
	@Update({
		" UPDATE classimage SET filename=#{obj.filename}, filedata=#{obj.filedata}, filetype=#{obj.filetype}, filesize=#{obj.filesize}, #{obj.typechk} WHERE NO=#{obj.no} " 
	})
	public int updateImageOne(@Param("obj") Classimage classcode);

}
