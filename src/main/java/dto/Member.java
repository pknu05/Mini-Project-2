package dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
  // 회원아이디(시퀀스)
  private String id;
  // 회원비밀번호
  private String password;
  // 회원이름
  private String name;
  // 회원이메일
  private String email;
  // 회원전화번호
  private String phone;
  // 성별(M,W)
  private String gender;
  // 생년월일
  private String birth;
  // 회원가입일자
  private Date regdate;
  // 회원가입여부(0,1)
  private int chk;
  
  private String newpassword;
}
