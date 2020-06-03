package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bss.model.BoardDAO;

public class RegistServiceImpl implements BoardService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.regist(writer, title, content);
	
		return 0;
	}

}
