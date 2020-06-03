package com.testweb.bss.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.testweb.util.JdbcUtil;

public class BoardDAO {
	
	private static BoardDAO instance = new BoardDAO();
	private DataSource ds;
	
	private BoardDAO() {

		try {

			InitialContext ct = new InitialContext();
			ds =(DataSource)ct.lookup("java:comp/env/jdbc/oracle");


		}catch(Exception e) {
			System.out.println("에러");
		}
	
	}

	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "select*from board order by bno desc";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String bno = rs.getString("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
			
				
				BoardVO vo = new BoardVO(bno,writer,title,content,regdate);
				
				list.add(vo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
			
		return list;
	}
	
	public BoardVO getContent(String bno) {
		BoardVO vo = new BoardVO();
		String sql = "select*from board where bno=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bno) );
			
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				vo.setBno(rs.getString("bno"));
				vo.setWriter(rs.getString("writer"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public int update(String bno,String writer,String title,String content) {
		
		int result = 0;
		String sql = "update board set writer=?, title=?,content=? where bno=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, bno);
			
			result =pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void regist(String writer,String title,String content) {
		
		String sql = "insert into board(bno,writer,title,content) values(board_seq.nextval,?,?,?)";

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}
	public void delete(String bno) {
		String sql = "delete from board where bno = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}

}
