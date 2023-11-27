package com.action.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.model.dto.Snack;

/**
 * Servlet implementation class DataTestServlet
 */
@WebServlet("/dataTest.do")
public class DataTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		Snack s2 = Snack.builder().name("가나초콜릿").price(1500).type("초콜릿").build();
		Snack s3 = Snack.builder().name("눈깔사탕").price(500).type("사탕").build();
		Snack s4 = Snack.builder().name("티코").price(6500).type("아이스크림").build();
		Snack s5 = Snack.builder().name("찰떡아이스").price(2500).type("아이스크림").build();
	
		List<Snack> snacks = List.of(s2, s3, s4, s5);
		
		request.setAttribute("snacks", snacks);
		
		HttpSession session = request.getSession();
		session.setAttribute("snacks", "sessionSnack");
		
		getServletContext().setAttribute("snacks", "contextSnack"); //application

		request.getRequestDispatcher("/views/el/datatest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
