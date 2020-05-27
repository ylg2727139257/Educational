package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TeacherMapper;
import com.service_interface.TeacherService;
import com.vo.Teacher;
@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper teacherMapper;
	@Override
	public boolean login(int tid, String password) {
		Teacher teacher0=new Teacher();
		teacher0.setTid(tid);
		List<Teacher> teachers=teacherMapper.findTeacher(teacher0);
		if(null!=teachers&&teachers.size()!=0&&teachers.get(0).getTkey().equals(password)) {
			return true;
		}
		return false;
	}
	@Override
	public List<Teacher> findTeacher(Teacher teacher) {
		return teacherMapper.findTeacher(teacher);
	}
	@Override
	public void insertTeacher(Teacher teacher) {
		teacherMapper.insertTeacher(teacher);
	}
	@Override
	public void updateTeacher(Teacher teacher) {
		teacherMapper.updateTeacher(teacher);
	}
	@Override
	public void deleteTeacher(Teacher teacher) {
		teacherMapper.deleteTeacher(teacher);
	}
	

}
