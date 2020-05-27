package com.dao;

import java.util.List;

import com.vo.Teacher;

public interface TeacherMapper {

	//--   查询 
	public List<Teacher> findTeacher(Teacher teacher);
	//--  添加
	public void insertTeacher(Teacher teacher);
	//--  修改
	public void updateTeacher(Teacher teacher);
	//--  删除
	public void deleteTeacher(Teacher teacher);
}
