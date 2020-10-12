package dao;

import model.Person;

public interface PersonDao {
	Integer getPersonMaxNo();
	void insertPerson(Person person);
	Person selectPerson(Person person);
}
