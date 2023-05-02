package dto;

import java.util.Date;

import lombok.Data;

//신청상태테이블
@Data
public class Applystatus {
	
private long no;
// 신청번호(시퀀스)
private long applyno;
// 신청 처리상태(1:결제완료, 2:결제취소, 3:참여완료)
private int chk;
// 상태등록일자
private Date regdate;

}