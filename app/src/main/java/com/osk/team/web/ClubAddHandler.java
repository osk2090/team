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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        Club c = new Club();

        request.setCharacterEncoding("UTF-8");

        c.setCarrive(request.getParameter("carrive"));
        c.setCtheme(request.getParameter("ctheme"));
        c.setCtitle(request.getParameter("ctitle"));
        c.setCcontent(request.getParameter("ccontent"));
        c.setCsdt(Date.valueOf(request.getParameter("csdt")));
        c.setCedt(Date.valueOf(request.getParameter("cedt")));

        HttpServletRequest httpRequest = request;
        int loginUser = (int) httpRequest.getSession().getAttribute("loginUser");//회원번호로 받기
        c.setCno(loginUser);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>클럽 등록</title>");

        try {
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
