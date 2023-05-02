package dto;

import java.util.Date;

import lombok.Data;

@Data
public class Session {
  // 시퀀스
  private long no;
  // 현재신청인원
  private long cnt;
  // 최소신청인원
  private long minimum;
  // 최대신청인원
  private long maximum;
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
  private long addprice;
  // 클래스 난이도(입문자, 경험자)
  private String classlevel;
  // 등록일자
  private Date regdate;
  // 클래스 코드(시퀀스)
  private long classcode;
}
