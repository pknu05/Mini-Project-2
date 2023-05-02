package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Session;

@Mapper
public interface SessionMapper {
	
	/***** 판매자 *****/
	
	/* (1) 세션 등록*/
	@Insert({
		" INSERT INTO SESSION(MINIMUM, MAXIMUM, CLASSDATE, CLASSDAY, CLASSSTART, CLASSEND, DISCOUNT, ADDPRICE, CLASSLEVEL, CLASSCODE) ",
		" VALUES(#{obj.minimum}, #{obj.maximum}, #{obj.classdate}, #{obj.classday},",
		" #{obj.classstart}, #{obj.classend}, #{obj.discount}, #{obj.addprice}, #{obj.classlevel}, #{obj.classcode}) " })
	public int insertSessionOne(@Param("obj") Session obj);
	
	/* (1)-1 클래스 가격 조회 => 세션등록시 추가금액 등록을 위해 */
	@Select({ " SELECT PRICE FROM CLASSPRODUCT WHERE CLASSCODE=#{classcode}" })
	public long selectPriceOne(@Param("classcode") long classcode); 
	
	
	/* (2) 세션 전체 조회 */
	@Select({ " SELECT * FROM SESSION WHERE CLASSCODE=#{classcode} ORDER BY REGDATE DESC "})
	public List<Session> selectSessionList(@Param("classcode") long classcode);
	
	/* (2)-1 세션 하나 조회 */
	@Select({
		" SELECT * FROM SESSION WHERE CLASSCODE=#{obj.classcode} AND NO=#{obj.no} "
	})
	public Session selectSessionOne(@Param("obj") Session obj);
	
	
	/* (3) 세션 수정 */
	@Update({ " UPDATE SESSION ",
			  " SET MINIMUM=#{obj.minimum}, MAXIMUM=#{obj.maximum}, CLASSDATE=#{obj.classdate}, CLASSDAY=#{obj.classday}, CLASSSTART=#{obj.classstart}, CLASSEND=#{obj.classend}, DISCOUNT=#{obj.discount}, ADDPRICE=#{obj.addprice}, CLASSLEVEL=#{obj.classlevel} ",
			  " WHERE NO=#{obj.no} AND CLASSCODE=#{obj.classcode} " })
	public int updateSessionOne(@Param("obj") Session obj);
	
	/* (4) 세션 하나 삭제 */
	@Delete({ " DELETE FROM SESSION WHERE NO=#{no} " })
	public int deleteSessionOne(@Param("no") long no);
	
	
	/* (5) 세션 목록 삭제 */
	@Delete({ 
		" <script> ", 
		" DELETE FROM SESSION WHERE CLASSCODE=#{map.classcode} AND NO IN( ",
			" <foreach collection='map.chk' item='tmp' separator=','> ",
	        	" #{tmp} ",
	        " </foreach> ",
	    "  ) ", 
		" </script> " })
	public int deleteSessionList(@Param("map") Map<String, Object> map);
	
}
