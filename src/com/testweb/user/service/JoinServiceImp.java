package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class JoinServiceImp implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		UserDAO dao = UserDAO.getInstance();
		int result =dao.checkId(id);
		if(result==1) {
			return 1;
		}else {
			UserVO vo = new UserVO(id,pw,name,phone1,phone2,phone3,email,address);
			dao.insert(vo);
			return 0;
		}
	}

}
