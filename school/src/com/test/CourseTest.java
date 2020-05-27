package com.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.CourseMapper;
import com.vo.Course;

public class CourseTest {
	private static ApplicationContext ac;

	public static void main(String[] args) {
		ac = new ClassPathXmlApplicationContext("spring.xml");
		
		/*StudentMapper sm=(StudentMapper)ac.getBean("studentMapper");
		Student stu=new Student();
		List<Student> stus=sm.findStudent(stu);
		for(Student s:stus) {
			System.out.println(s);*/
		
		CourseMapper cm=(CourseMapper)ac.getBean("courseMapper");
		Course course0=new Course();
		course0.setCtype(1);
		List<Course> courses=cm.findTC(course0);
		for(Course course:courses) {
			System.out.println(course);
		}
	}
	

}
