package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bss.model.BoardDAO;

public class DeleteServiceImpl implements BoardService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String bno = request.getParameter("bno");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.delete(bno);
		return 0;
	}

}
