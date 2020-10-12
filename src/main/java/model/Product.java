package model;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Product {
	private Integer product_no;
	@NotEmpty(message = "제목을 입력해주세요.")
	private String product_title;
	@NotEmpty(message = "내용을 입력해주세요.")
	private String product_content;
	private String product_img;
	@NotNull(message = "가격을 입력해주세요.")
	private Integer product_price;
	private String product_date;
	private Integer person_no;
	private String person_name;
	
	public Integer getProduct_no() {
		return product_no;
	}
	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
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

	private MultipartFile imagename;
	public MultipartFile getImagename() {
		return imagename;
	}
	public void setImagename(MultipartFile imagename) {
		this.imagename = imagename;
	}
}
