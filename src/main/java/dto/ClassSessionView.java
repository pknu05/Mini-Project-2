package dto;

import java.util.Date;

import lombok.Data;

@Data
public class ClassSessionView {

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
	// 회원아이디(시퀀스)
	private String memberid;

	private long no;
	// 현재신청인원
	private int cnt;
	// 최소신청인원
	private int minimum;
	// 최대신청인원
	private int maximum;
	// 날짜
	private String classdate;
	// 요일
	private String classday;
	// 오전 6:00
	private String classstart;
	// 오후 9:00
	private String classend;
	// 할인률
	private float discount;
	// 클래스 추가금액
	private int addprice;
	// 클래스 난이도(입문자, 경험자)
	private String classlevel;
	// 등록일자
	private Date seregdate;
	
	private String localcate;
	
	private long citycode;

	private String citycate;
	
	private String actdetailcate;
	// 101,102,103
	private long activitycode;
	
	private String actcate;
	
	private long totalprice;
	
}
