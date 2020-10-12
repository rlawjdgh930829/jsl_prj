package dao;

import java.util.List;

import model.Reply;

public interface ReplyDao {
	Integer getReplyMax();
	void insertReply(Reply reply);
	List<Reply> allReply(Integer no);
	Integer getReplyMaxOrder();
	void deleteReply(Integer no);
	void subReply(Reply reply);
	Integer getOrder(Integer replyNo);
	void setOrder(Integer orderNo);
	Integer getDepth(Integer replyNo);
}
