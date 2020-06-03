package com.testweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.service.BoardService;
import com.testweb.bbs.service.ContentServiceImpl;
import com.testweb.bbs.service.DeleteServiceImpl;
import com.testweb.bbs.service.GetListServiceImp;
import com.testweb.bbs.service.RegistServiceImpl;
import com.testweb.bbs.service.UpdateServiceImpl;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardController() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String path  = request.getContextPath();

		String command = uri.substring(path.length()); 
		
		BoardService service = null;
		
		if(command.equals("/bbs/list.board")) {
			
			service = new GetListServiceImp();
			service.execute(request, response);
			
			request.getRequestDispatcher("bbs.jsp").forward(request, response);
			
		} else if(command.equals("/bbs/write.board")) { 
			
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);
			
		} else if(command.equals("/bbs/regist.board")) { 
			
			service = new RegistServiceImpl();
			service.execute(request, response);
					
			response.sendRedirect("list.board");
			
			
		}else if(command.equals("/bbs/content.board")) {
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
			
		}else if(command.equals("/bbs/modify.board")) {
			
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);
			
		}else if(command.equals("/bbs/update.board")) {
			
			service = new UpdateServiceImpl();		
			service.execute(request, response);
			
			response.sendRedirect("content.board?bno="+request.getParameter("bno"));
			
		}else if(command.equals("/bbs/delete.board")) {
			
			service = new DeleteServiceImpl();
			int result =service.execute(request, response);
			System.out.println(result);
			response.sendRedirect("list.board");
		}
		}
}
