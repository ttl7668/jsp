package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class GetInfoServiceImp implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserDAO dao = UserDAO.getInstance();
		UserVO vo =dao.getinfo(id);

		
		request.setAttribute("uservo", vo);
		
		return 0;
	}

}
