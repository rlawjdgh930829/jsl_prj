package dao;

import java.util.List;
import model.Product;

public interface ProductDao {
	Integer getProductMaxNo();
	void insertProduct(Product product);
	List<Product> listProduct(Integer pageNo, String search);
	Integer listCnt(String search);
	Product detail(Integer no);
	void delete(Integer no);
	void modify(Product product);
}
