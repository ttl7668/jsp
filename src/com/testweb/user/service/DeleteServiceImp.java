package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserDAO;

public class DeleteServiceImp implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id + " + " + pw);
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.login(id, pw);
		
		if(result==1) {
			dao.delete(id);
			session.invalidate();
			return 1;
		}else {
			
			return 0;
		}
	}

}
