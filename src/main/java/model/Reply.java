package model;

public class Reply {
	private Integer reply_no;
	private String reply_content;
	private Integer reply_group;
	private Integer reply_order;
	private Integer reply_depth;
	private Integer person_no;
	private Integer product_no;
	private String person_name;;
	
	public Integer getReply_no() {
		return reply_no;
	}
	public void setReply_no(Integer reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Integer getReply_group() {
		return reply_group;
	}
	public void setReply_group(Integer reply_group) {
		this.reply_group = reply_group;
	}
	public Integer getReply_order() {
		return reply_order;
	}
	public void setReply_order(Integer reply_order) {
		this.reply_order = reply_order;
	}
	public Integer getReply_depth() {
		return reply_depth;
	}
	public void setReply_depth(Integer reply_depth) {
		this.reply_depth = reply_depth;
	}
	public Integer getPerson_no() {
		return person_no;
	}
	public void setPerson_no(Integer person_no) {
		this.person_no = person_no;
	}
	public Integer getProduct_no() {
		return product_no;
	}
	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}
	public String getPerson_name() {
		return person_name;
	}
	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}
}
