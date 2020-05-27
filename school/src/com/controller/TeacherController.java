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
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@Autowired 
	private CourseService courseService;
	@Autowired 
	private ElectService electService;
	@RequestMapping("/teaLogin.action")
	public void login(int lid,String password,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		if(teacherService.login(lid, password)) {
			Teacher teacher0=new Teacher();
			teacher0.setTid(lid);
			Teacher teacher=teacherService.findTeacher(teacher0).get(0);
			session.setAttribute("TEACHER", teacher);
			out.println("<script>alert('登 录 成 功！');location.href='jsp/teaIndex.jsp';</script>");
		}else {
			out.println("<script>alert('登录失败，请重新登录！');location.href='jsp/login.jsp';</script>");
		}
	}
	@RequestMapping("/teaModify.action")
	public void modify(String mpass,String newpass,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Teacher teacher0=(Teacher)session.getAttribute("TEACHER");
		if(teacher0.getTkey().equals(mpass)) {
			teacher0.setTkey(newpass);
			teacherService.updateTeacher(teacher0);
			session.removeAttribute("TEACHER");
			out.println("<script>alert('请重新登录！');parent.location.href='jsp/login.jsp';</script>");
		}else {
			out.println("<script>alert('原始密码不正确，请重新输入！');location.href='jsp/teaModify.jsp';</script>");
		}
	}
	@RequestMapping("/teaCourse.action")
	public void teaCourse(String cname,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		cname=null==cname ? "" : cname;
		session.setAttribute("LIKETCOUR", cname);
		Course course0=new Course();
		int tid=((Teacher)session.getAttribute("TEACHER")).getTid();
		course0.setTid(tid);
		course0.setCname("%" + cname + "%");
		List<Course> courses=courseService.findCourse(course0);
		session.setAttribute("TCOURSE", courses);
		out.println("<script>location.href='jsp/teaCourse.jsp';</script>");
	}
	@RequestMapping("/teaSlist.action")
	public void teaSlist(String cnote,Integer cid,Integer page,String sname,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String cnote0=(null==(String)session.getAttribute("OBTEASLIST")) ? "" : ((String)session.getAttribute("OBTEASLIST"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		session.setAttribute("OBTEASLIST", cnote);
		int pageSize=6;
		int pageNum = 0;
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		cid = null == cid ?(Integer)session.getAttribute("TSCID") : cid;
		sname=null==sname?"":sname;
		session.setAttribute("TSCID", cid);
		session.setAttribute("LIKETSLIST", sname);
		Student student=new Student();
		Elect elect=new Elect();
		elect.setCid(cid);
		student.setElect(elect);
		student.setCnote(cnote);
		student.setSname("%"+sname+"%");
		PageHelper.startPage(pageNum,pageSize);
		List<Student> students=studentService.findSE(student);
		session.setAttribute("SE", students);
		PageInfo<?> pageInfo = new PageInfo<>(students);
		session.setAttribute("SEPAGEINFO",pageInfo);
		out.println("<script>location.href='jsp/teaStlist.jsp';</script>");
	}
	@RequestMapping("/teaUE.action")
	public void teaUE(int cid,int sid,double score,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		Elect elect0=new Elect();
		elect0.setCid(cid);
		elect0.setSid(sid);
		Elect elect=electService.findElect(elect0).get(0);
		elect0.setScore(score);
		electService.updateElect(elect0);
		
		Course course=new Course();
		course.setCid(cid);
		double credit=(courseService.findCourse(course).get(0)).getCredit();
		
		Student student0=new Student();
		student0.setSid(sid);
		Student student=studentService.findStudent(student0).get(0);
		double credit0=student.getCredit();
		if(elect.getScore()>=60&&score<60) {
			student.setCredit(credit0-credit);
		}else if(elect.getScore()<60&&score>=60) {
			student.setCredit(credit0+credit);
		}
		studentService.updateStudent(student);
		out.println("<script>location.href='teaSlist.action';</script>");
	}
	
}
