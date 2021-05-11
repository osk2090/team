package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Date;

@SuppressWarnings("serial")
@WebServlet("/club/add")
public class ClubAddHandler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>클럽 등록</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>클럽 등록</h1>");
        out.println("<form action='add' method='post'>");
        out.println("도착지: <input type='text' name='arrive'><br>");
        out.println("가는날: <input type='date' name='startDate'><br>");
        out.println("오는날: <input type='date' name='endDate'><br>");
        out.println("테마: ");
        out.println("<select>" +
                "<option value='1박2일' name='theme' value='1박2일'>1박2일</option>" +
                "<option value='2박3일' name='theme' value='2박3일'>2박3일</option>" +
                "<option value='3박4일' name='theme' value='3박4일'>3박4일</option>" +
                "<option value='무박' name='theme' value='무박'>무박</option>" +
                "<option value='당일치기' name='theme' value='당일치기'>당일치기</option>" +
                "<option value='식사' name='theme' value='식사'>식사</option>"
        );
        out.println("</select><br>");

        out.println("제목: <input type='text' name='title'><br>");
        out.println("내용: <textarea name='content' rows='10' cols='60'></textarea><br>");
        out.println("인원수<최대 10명>: <input type='number' name='count'><br>");

        out.println("<input type='submit' value='등록'>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");

//        try {
//            String[] themeList = {"1박2일", "2박3일", "3박4일", "무박", "당일치기", "식사"};
//            for (String t : themeList) {
//                out.printf(" <input type='");
//            }
//        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>클럽 등록</title>");

        try {
            Club c = new Club();

            c.setArrive(request.getParameter("arrive"));
            c.setStartDate(Date.valueOf(request.getParameter("startDate")));
            c.setEndDate(Date.valueOf(request.getParameter("endDate")));
            c.setTheme(request.getParameter("theme"));
            c.setTitle(request.getParameter("title"));
            c.setContent(request.getParameter("content"));
            c.setTotal(Integer.parseInt(request.getParameter("count")));

            //방장이니까 한명이 클럽생성하면 자동 증가코드 추가하기

            Member loginUser = (Member) request.getSession().getAttribute("loginUser");//회원번호로 받기
            c.setWriter(loginUser);//회원번호로 받기

            clubService.add(c);

            out.println("<meta http-equiv='Refresh' content='1;url=list'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>클럽 등록</h1>");
            out.println("<p>클럽 등록했습니다.</p>");

        } catch (Exception e) {
            StringWriter strWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(strWriter);
            e.printStackTrace(printWriter);

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>클럽 등록 오류</h1>");
            out.printf("<pre>%s</pre>\n", strWriter.toString());
            out.println("<p><a href='list'>클럽 목록</a></p>");
        }

        out.println("</body>");
        out.println("</html>");
    }
}
