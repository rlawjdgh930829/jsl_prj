package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;
	
	public Integer getReplyMax() {
		return session.selectOne("reply.getMaxNo");
	}

	public void insertReply(Reply reply) {
		session.insert("reply.insertReply", reply);
	}

	public List<Reply> allReply(Integer no) {
		return session.selectList("reply.allReply", no);
	}

	public Integer getReplyMaxOrder() {
		return session.selectOne("reply.getReplyMaxOrder");
	}

	public void deleteReply(Integer no) {
		session.delete("reply.deleteReply", no);
	}

	public void subReply(Reply reply) {
		session.insert("reply.subReply", reply);
	}

	public Integer getOrder(Integer replyNo) {
		return session.selectOne("reply.getOrder", replyNo);
	}

	public void setOrder(Integer orderNo) {
		session.update("reply.setOrder", orderNo);
	}

	public Integer getDepth(Integer replyNo) {
		return session.selectOne("reply.getDepth", replyNo);
	}

}
