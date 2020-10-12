package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSession session;
	
	public Integer getProductMaxNo() {
		return session.selectOne("product.getMaxNo");
	}

	public void insertProduct(Product product) {
		session.insert("product.insertProduct", product);
	}

	public List<Product> listProduct(Integer pageNo, String search) {
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("pageNo", pageNo);
		map.put("search", search);
		return session.selectList("product.listProduct", map);
	}

	public Integer listCnt(String search) {
		return session.selectOne("product.listCnt", search);
	}

	public Product detail(Integer no) {
		return session.selectOne("product.detail", no);
	}

	public void delete(Integer no) {
		session.delete("product.delete", no);
	}

	public void modify(Product product) {
		session.update("product.modify", product);
	}

}
