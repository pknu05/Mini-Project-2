package dto;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyStatusView {
	
	// status 고유 번호 (sequence)
	private long no;
	// 신청 번호
	private long applyno;
	// 신청 상태 -> 1 / 2 / 3
	private int chk;
	// applystatus 등록 날짜
	private Date regdate;
	// 신청 인원
	private int person;
	// 신청자 아이디
	private String memberid;
	// 신청 클래스 세션 번호
	private long sessionno;
	// 신청 클래스 번호
	private long classcode;
	// 클래스 제목
	private String title;
	// 클래스 주소
	private String address1;
	private String address2;
	private String address3;
	// 클래스 기본 가격
	private long price;
	// 클래스 등록자 아이디
	private String instructorid;
	// 클래스 상호명
	private String nickname;
	// 클래스 실시 날짜
	private String classdate;
	// 클래스 시작 시간
	private String classstart;
	// 클래스 종료 시간
	private String classend;
	// 클래스 가격 할인율
	private float discount;
	// 클래스 추가 가격
	private int addprice;
	// 클래스 난이도
	private int classlevel;
	// 클래스 상위 카테고리
	private String actcate;
	// 클래스 하위 카테고리
	private String actdetailcate;
	// 클래스 세션 총 가격 ( 기본 금액 + 추가 금액 ) x 할인율
	private long totalprice;
	// 신청 지불 금액 ( 총 가격 X 신청 인원)
	private long payment;
	

}