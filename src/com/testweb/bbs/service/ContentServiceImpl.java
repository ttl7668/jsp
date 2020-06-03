package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bss.model.BoardDAO;
import com.testweb.bss.model.BoardVO;

public class ContentServiceImpl implements BoardService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String bno = request.getParameter("bno");
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.getContent(bno);
		
		request.setAttribute("VO", vo);
		return 0;
	}

}
