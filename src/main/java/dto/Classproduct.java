package dto;

import java.util.Date;

import lombok.Data;

//클래스 리스트 테이블
@Data
public class Classproduct {
	// 클래스 코드(시퀀스)
	private long classcode;
	// 제목
	private String title;
	// 우편번호
	private String postcode;
	// 도로명주소,지번주소
	private String address1;
	// 상세주소
	private String address2;
	// 참고항목
	private String address3;
	// 위도
	private String latitude;
	// 경도
	private String longitude;
	// 가격
	private long price;
	// 강사소개
	private String instructor;
	// 상호명
	private String nickname;
	// 소개글
	private String intro;
	// 커리큘럼
	private String curriculum;
	// 조회수
	private long hit;
	// 등록일자
	private Date regdate;
	// 승인여부(0,1)
	private int chk;
	// 상세지역카테고리
	private long localcode;
	// 액티비티디테일카테고리
	private long actcode;
	// 회원아이디
	private String memberid;
}
