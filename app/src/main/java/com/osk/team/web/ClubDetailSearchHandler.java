package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/detailSearch")
public class ClubDetailSearchHandler extends HttpServlet {

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.print("<p><a href='detailSearch'>참여</a></p>");
        out.print("<p><a href='club.html'>생성</a></p>");

        out.println("[클럽 상세 검색 결과]");

        try {
            String arrive = request.getParameter("arrive");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String theme = request.getParameter("theme");

            List<Club> clubs = clubService.search(arrive, startDate, endDate, theme);

            for (Club c : clubs) {
                out.printf("<tr>"
                                + " <td><a href='detail?no=%1$d'>%d</a></td>"
                                + " <td>%s</td>"
                                + " <td>%s</td>"
                                + " <td>%s</td>"
                                + " <td>%s</td>"
                                + " <td>%d</td> </tr>\n",
                        c.getNo(),
                        c.getArrive(),
                        c.getStartDate(),
                        c.getEndDate(),
                        c.getTheme(),
                        c.getTotal());
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
