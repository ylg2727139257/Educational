package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StudentMapper;
import com.service_interface.StudentService;
import com.vo.Student;
@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	@Override
	public boolean login(int sid,String password) {
		Student student0=new Student();
		student0.setSid(sid);
		List<Student> students=studentMapper.findStudent(student0);
		if(null!=students&&students.size()!=0&&students.get(0).getSkey().equals(password)) {
			return true;
		}
		return false;
	}
	@Override
	public List<Student> findStudent(Student student) {
		return studentMapper.findStudent(student);
	}
	@Override
	public void updateStudent(Student student) {
		studentMapper.updateStudent(student);
	}
	@Override
	public List<Student> findSE(Student student) {
		return studentMapper.findSE(student);
	}
	
	
	
	
	
	
	@Override
	public void insertStudent(Student student) {
		studentMapper.insertStudent(student);
	}
	@Override
	public void deleteStudent(Student student) {
		studentMapper.deleteStudent(student);
	}
	

	
}
