package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class UpdateServiceImp implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("pnone3");
		String address = request.getParameter("address");
		
		UserDAO dao = UserDAO.getInstance();
		UserVO vo = new UserVO(id, pw, name, phone1, phone2, phone3, email, address);
		int result =dao.update(vo);
				
		return result;
	}

}
