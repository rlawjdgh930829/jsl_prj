package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Person;

@Repository
public class PersonDaoImpl implements PersonDao {
	
	@Autowired
	private SqlSession session;

	public Integer getPersonMaxNo() {
		return session.selectOne("person.getMaxNo");
	}

	public void insertPerson(Person person) {
		session.insert("person.putPerson", person);
	}

	public Person selectPerson(Person person) {
		return session.selectOne("person.selectPerson", person);
	}

}
