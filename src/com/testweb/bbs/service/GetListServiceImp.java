package com.testweb.bbs.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bss.model.BoardDAO;
import com.testweb.bss.model.BoardVO;

public class GetListServiceImp implements BoardService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> list =dao.getList();
		
		request.setAttribute("list", list);
		return 0;
	}

}
