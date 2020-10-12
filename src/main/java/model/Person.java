package model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Service;

public class Person {
	private Integer person_no;
	@NotEmpty(message = "닉네임을 입력해주세요.")
	private String person_name;
	@NotEmpty(message = "이메일을 입력해주세요.")
	@Email(message = "이메일 형식을 맞춰주세요.")
	private String person_email;
	@NotEmpty(message = "비밀번호를 입력해주세요.")
	@Pattern(regexp="[a-zA-Z1-9]{6,12}", message = "비밀번호는 영어와 숫자를 포함해서 6~12자리 이내로 입력해주세요.")
	private String person_pwd;
	
	public Integer getPerson_no() {
		return person_no;
	}
	public void setPerson_no(Integer person_no) {
		this.person_no = person_no;
	}
	public String getPerson_name() {
		return person_name;
	}
	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}
	public String getPerson_email() {
		return person_email;
	}
	public void setPerson_email(String person_email) {
		this.person_email = person_email;
	}
	public String getPerson_pwd() {
		return person_pwd;
	}
	public void setPerson_pwd(String person_pwd) {
		this.person_pwd = person_pwd;
	}
}
