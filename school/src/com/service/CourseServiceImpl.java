package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CourseMapper;
import com.service_interface.CourseService;
import com.vo.Course;
@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseMapper courseMapper;
	@Override
	public List<Course> findCourse(Course course){
		return courseMapper.findCourse(course);
	}
	@Override
	public List<Course> findTC(Course course){
		return courseMapper.findTC(course);
	}
	@Override
	public List<Course> findTC1(Course course){
		return courseMapper.findTC1(course);
	}
	@Override
	public List<Course> findTCE(Course course){
		return courseMapper.findTCE(course);
	}
	@Override
	public List<Course> findTCE1(Course course){
		return courseMapper.findTCE1(course);
	}
	@Override
	public void insertCourse(Course course){
		courseMapper.insertCourse(course);
	}
	@Override
	public void updateCourse(Course course){
		courseMapper.updateCourse(course);
	}
	@Override
	public void deleteCourse(Course course){
		courseMapper.deleteCourse(course);
	}
}
