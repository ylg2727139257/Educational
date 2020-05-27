package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
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
import com.vo.Course;
import com.vo.Elect;
import com.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired 
	private CourseService courseService;
	@Autowired 
	private ElectService electService;
	@RequestMapping("/stuLogin.action")
	public void stuLogin(int lid,String password,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		if(studentService.login(lid, password)) {
			Student student0=new Student();
			student0.setSid(lid);
			Student student=studentService.findStudent(student0).get(0);
			session.setAttribute("STUDENT", student);
			out.println("<script>alert('登 录 成 功！');location.href='jsp/stuIndex.jsp';</script>");
		}else {
			out.println("<script>alert('登录失败，请重新登录！');location.href='jsp/login.jsp';</script>");
		}
	}
	@RequestMapping("/modify.action")
	public void modify(String mpass,String newpass,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Student student0=(Student)session.getAttribute("STUDENT");
		if(student0.getSkey().equals(mpass)) {
			student0.setSkey(newpass);
			studentService.updateStudent(student0);
			session.removeAttribute("STUDENT");
			out.println("<script>alert('请重新登录！');parent.location.href='jsp/login.jsp';</script>");
		}else {
		out.println("<script>alert('原始密码不正确，请重新输入！');location.href='jsp/stuModify.jsp';</script>");
		}
	}
	@RequestMapping("/required.action")
	public void required(String cnote,String cname,Integer page,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		int pageSize=8;
		int pageNum = 0;
		String cnote0=(null==(String)session.getAttribute("OBREQUIRED")) ? "" : ((String)session.getAttribute("OBREQUIRED"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		cname=null==cname?"":cname;
		session.setAttribute("OBREQUIRED", cnote);
		session.setAttribute("LIKEREQ", cname);
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		PageHelper.startPage(pageNum,pageSize);
		Course course0=new Course();
		course0.setCtype(2);
		course0.setCnote(cnote);
		course0.setCname("%"+cname+"%");
		List<Course> courses=courseService.findTC(course0);
		PageInfo<?> pageInfo = new PageInfo<>(courses);
		session.setAttribute("COURSES", pageInfo);
		out.println("<script>location.href='jsp/stuRequired.jsp';</script>");
	}
	@RequestMapping("/elective.action")
	public void elective(String cnote,String cname,Integer page,HttpServletRequest request,HttpServletResponse response) 
			throws IOException, ServletException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String cnote0=(null==(String)session.getAttribute("OBELECTIVE")) ? "" : ((String)session.getAttribute("OBELECTIVE"));
		if(null!=cnote&&!cnote.equals("")&&null!=cnote0&&!cnote0.equals("")&&cnote.equals(cnote0.split("/")[0])&&cnote0.split("/").length==1) {
			cnote=cnote+"/desc";
		}
		cnote=null==cnote?cnote0:cnote;
		session.setAttribute("OBELECTIVE", cnote);
		cname=null==cname?"":cname;
		session.setAttribute("LIKEELECT", cname);
		int pageSize=6;
		int pageNum = 0;
		if(null==page||page.intValue()<1) {
			pageNum=1;
		}else {
			pageNum = page.intValue();
		}
		int sid=((Student)session.getAttribute("STUDENT")).getSid();
		Elect elect=new Elect();
		elect.setSid(sid);
		Course course0=new Course();
		course0.setElect(elect);
		List<Course> courses0=courseService.findTCE(course0);
		session.setAttribute("COURSES0", courses0);
 		Course course1=new Course();
		course1.setCtype(1);
		List<Course> courses1=courseService.findTC1(course1);
		session.setAttribute("COURSES1", courses1);
		
		course0.setCtype(1);
		course0.setCnote(cnote);
		course0.setCname("%"+cname+"%");
		PageHelper.startPage(pageNum,pageSize);
		List<Course> courses=courseService.findTCE1(course0);
        PageInfo<?> pageInfo = new PageInfo<>(courses);
		session.setAttribute("PAGEINFO", pageInfo);
		out.println("<script>location.href='jsp/stuElective.jsp';</script>");
	}
	@RequestMapping("/insertElect.action")
	public void insertElect(int cid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Elect elect=new Elect();
		int sid=((Student)session.getAttribute("STUDENT")).getSid();
		elect.setSid(sid);
		List<Elect> elects=electService.findElect(elect);
		elect.setCid(cid);
		Course course0=new Course();
		course0.setCid(cid);
		Course course=courseService.findCourse(course0).get(0);
		course.setCurr(course.getCurr()+1);
		if(elects.size()<3) {
			electService.insertElect(elect);
			courseService.updateCourse(course);
			out.println("<script>alert('选  课  成  功！');location.href='elective.action';</script>");
		}else {
			out.println("<script>alert('选课失败，已选课程已达3科上限！');location.href='elective.action';</script>");
		}
	}
	@RequestMapping("/reserved.action")
	public void reserved(HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		Elect elect=new Elect();
		Course course0=new Course();
		course0.setCtype(1);
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		int sid=((Student)session.getAttribute("STUDENT")).getSid();
		elect.setSid(sid);
		course0.setElect(elect);
		List<Course> courses=courseService.findTCE(course0);
		session.setAttribute("COURSES2", courses);
		out.println("<script>location.href='jsp/stuReserved.jsp';</script>");
	}
	@RequestMapping("/deleteElect.action")
	public void deleteElect(int cid,HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		int sid=((Student)session.getAttribute("STUDENT")).getSid();
		Elect elect=new Elect();
		elect.setCid(cid);
		elect.setSid(sid);
		electService.deleteElect(elect);
		Course course0=new Course();
		course0.setCid(cid);
		Course course=courseService.findCourse(course0).get(0);
		course.setCurr(course.getCurr()-1);
		courseService.updateCourse(course);
		out.println("<script>location.href='reserved.action';</script>");
	}

}
