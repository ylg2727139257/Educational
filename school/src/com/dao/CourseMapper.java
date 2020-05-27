package com.dao;

import java.util.List;

import com.vo.Course;

public interface CourseMapper {
	//--   查询 
	public List<Course> findCourse(Course course);
	//--   和teacher表联查
	public List<Course> findTC(Course course);
	//--   和teacher表联查
	public List<Course> findTC1(Course course);
	//--   和teacher表,elect表 联查
	public List<Course> findTCE(Course course);
	//--   和teacher表,elect表 联查
	public List<Course> findTCE1(Course course);
	//--  添加
	public void insertCourse(Course course);
	//--  修改
	public void updateCourse(Course course);
	//--  删除
	public void deleteCourse(Course course);
}
