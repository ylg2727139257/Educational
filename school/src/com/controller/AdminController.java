package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service_interface.CourseService;
import com.service_interface.ElectService;
import com.service_interface.StudentService;
import com.service_interface.TeacherService;
import com.vo.Course;
import com.vo.Elect;
import com.vo.Student;
import com.vo.Teacher;
@Controller
public class AdminController {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@Autowired 
	private CourseService courseService;
	@Autowired 
	private ElectService electService;
	@RequestMapping("/adminLogin.action")
	public void login(int lid,String password,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		if(teacherService.login(lid, password)) {
			Teacher teacher0=new Teacher();
			teacher0.setTid(lid);
			Teacher teacher=teacherService.findTeacher(teacher0).get(0);
			session.setAttribute("ADMIN", teacher);
			session.setAttribute("TEACHER", teacher);
			out.println("<script>alert('登 录 成 功！');location.href='jsp/adminIndex.jsp';</script>");
		}else {
			out.println("<script>alert('登录失败，请重新登录！');location.href='jsp/login.jsp';</script>");
		}
	}
	@RequestMapping("/adminStu.action")
	public void adminStu(String cnote,Integer page,String sname,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String cnote0=(null==(String)session.getAttribute("OBADMINSTU")) ? "" : ((String)session.getAttribute("OBADMINSTU"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		session.setAttribute("OBADMINSTU", cnote);
		int pageSize=8;
		int pageNum = 0;
		sname=null==sname?"":sname;
		session.setAttribute("LIKEAS", sname);
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		Student student=new Student();
		student.setCnote(cnote);
		student.setSname("%"+sname+"%");
		PageHelper.startPage(pageNum,pageSize);
		List<Student> students=studentService.findStudent(student);
		PageInfo<?> pageInfo = new PageInfo<>(students);
		session.setAttribute("ASPAGEINFO", pageInfo);
		out.println("<script>location.href='jsp/adminStu.jsp';</script>");
	}
	@RequestMapping("/insertStudent.action")
	public void insertStudent(Student student,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		studentService.insertStudent(student);
		out.println("<script>alert('添  加  成  功！');location.href='adminStu.action';</script>");
	}
	@RequestMapping("/findAS.action")
	public void findAS(int sid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Student student0=new Student();
		student0.setSid(sid);
		Student student=studentService.findStudent(student0).get(0);
		session.setAttribute("USTUDENT", student);
		out.println("<script>location.href='jsp/adminSUP.jsp';</script>");
	}
	@RequestMapping("/updateStudent.action")
	public void updateStudent(Student student,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		studentService.updateStudent(student);
		out.println("<script>alert('修  改  成  功！');location.href='adminStu.action';</script>");
	}
	@RequestMapping("/deleteStudent.action")
	public void deleteStudent(int sid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		Student student=new Student();
		student.setSid(sid);
		Elect elect=new Elect();
		elect.setSid(sid);
		electService.deleteElect(elect);
		studentService.deleteStudent(student);
		out.println("<script>alert('删  除  成  功！');location.href='adminStu.action';</script>");
	}
	@RequestMapping("/adminTea.action")
	public void adminTea(String cnote,Integer page,String tname,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String cnote0=(null==(String)session.getAttribute("OBADMINTEA")) ? "" : ((String)session.getAttribute("OBADMINTEA"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		session.setAttribute("OBADMINTEA", cnote);
		int pageSize=8;
		int pageNum = 0;
		tname=null==tname?"":tname;
		session.setAttribute("LIKEAT", tname);
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		Teacher teacher=new Teacher();
		teacher.setCnote(cnote);
		teacher.setTname("%"+tname+"%");
		PageHelper.startPage(pageNum,pageSize);
		List<Teacher> teachers=teacherService.findTeacher(teacher);
		PageInfo<?> pageInfo = new PageInfo<>(teachers);
		session.setAttribute("ATPAGEINFO", pageInfo);
		out.println("<script>location.href='jsp/adminTea.jsp';</script>");
	}
	@RequestMapping("/insertTeacher.action")
	public void insertTeacher(Teacher teacher,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		teacherService.insertTeacher(teacher);
		out.println("<script>alert('添  加  成  功！');location.href='adminTea.action';</script>");
	}
	@RequestMapping("/findAT.action")
	public void findAT(int tid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Teacher teacher0=new Teacher();
		teacher0.setTid(tid);
		Teacher teacher=teacherService.findTeacher(teacher0).get(0);
		session.setAttribute("UTEACHER", teacher);
		out.println("<script>location.href='jsp/adminTUP.jsp';</script>");
	}
	@RequestMapping("/updateTeacher.action")
	public void updateStudent(Teacher teacher,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		teacherService.updateTeacher(teacher);
		out.println("<script>alert('修  改  成  功！');location.href='adminTea.action';</script>");
	}
	@RequestMapping("/deleteTeacher.action")
	public void deleteTeacher(int tid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		Teacher teacher=new Teacher();
		teacher.setTid(tid);
		Course course=new Course();
		course.setTid(tid);
		List<Course> courses=courseService.findCourse(course);
		if(courses.size()<0) {
			teacherService.deleteTeacher(teacher);
			out.println("<script>alert('删  除  成  功！');location.href='adminTea.action';</script>");
		}else {
			out.println("<script>alert('该教师有课程尚未交接，暂无法删除！');location.href='adminTea.action';</script>");
		}
	}
	@RequestMapping("/adminCour.action")
	public void adminCour(String cnote,Integer page,String cname,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String cnote0=(null==(String)session.getAttribute("OBADMINCOUR")) ? "" : ((String)session.getAttribute("OBADMINCOUR"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		cname=null==cname?"":cname;
		session.setAttribute("OBADMINCOUR", cnote);
		session.setAttribute("LIKEAC", cname);
		int pageSize=8;
		int pageNum = 0;
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		Course course=new Course();
		course.setCnote(cnote);
		course.setCname("%"+cname+"%");
		PageHelper.startPage(pageNum,pageSize);
		List<Course> courses=courseService.findCourse(course);
		PageInfo<?> pageInfo = new PageInfo<>(courses);
		session.setAttribute("ACPAGEINFO", pageInfo);
		out.println("<script>location.href='jsp/adminCour.jsp';</script>");
	}
	@RequestMapping("/findCT.action")
	public void findCT(HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		List<Teacher> teachers=teacherService.findTeacher(new Teacher());
		session.setAttribute("ACTEACHER", teachers);
		out.println("<script>location.href='jsp/adminCIN.jsp';</script>");
	}
	@RequestMapping("/insertCourse.action")
	public void insertCourse(Course course,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		courseService.insertCourse(course);
		out.println("<script>alert('添  加  成  功！');location.href='adminCour.action';</script>");
	}
	@RequestMapping("/findAC.action")
	public void findAC(int cid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Course course0=new Course();
		course0.setCid(cid);
		Course course=courseService.findCourse(course0).get(0);
		session.setAttribute("UCOURSE", course);
		List<Teacher> teachers=teacherService.findTeacher(new Teacher());
		session.setAttribute("ACUTEACHER", teachers);
		out.println("<script>location.href='jsp/adminCUP.jsp';</script>");
	}
	@RequestMapping("/updateCourse.action")
	public void updateCourse(Course course,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		courseService.updateCourse(course);
		out.println("<script>alert('修  改  成  功！');location.href='adminCour.action';</script>");
	}
	@RequestMapping("/deleteCourse.action")
	public void deleteCourse(int cid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		Course course=new Course();
		course.setCid(cid);
		courseService.deleteCourse(course);
		out.println("<script>alert('删  除  成  功！');location.href='adminCour.action';</script>");
	}
	
}
