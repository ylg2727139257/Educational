package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SchoolController {
	
	@RequestMapping("/login.action")
	public void stuLogin(int lid,String password,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		PrintWriter out=response.getWriter();
		if(lid>190000) {
			out.println("<script>location.href='stuLogin.action?lid="+lid
					+"&password="+password+"';</script>");
		}else if(lid>110000&&lid<190000) {
			out.println("<script>location.href='teaLogin.action?lid="+lid
					+"&password="+password+"';</script>");
		}else if(lid<110000) {
			out.println("<script>location.href='adminLogin.action?lid="+lid
					+"&password="+password+"';</script>");
		}
	}
	@RequestMapping("/exit.action")
	public void exit(HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		HttpSession session=request.getSession();
		session.removeAttribute("ADMIN");
		session.removeAttribute("STUDENT");
		session.removeAttribute("TEACHER");
		response.sendRedirect("jsp/login.jsp");
	}
}
