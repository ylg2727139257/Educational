package com.dao;

import java.util.List;

import com.vo.Student;

public interface StudentMapper {
	//--   查询 
	public List<Student> findStudent(Student student);
	//--   和elect表 联查 
	public List<Student> findSE(Student student);
	//--  添加
	public void insertStudent(Student student);
	//--  修改
	public void updateStudent(Student student);
	//--  删除
	public void deleteStudent(Student student);
}
