package com.osk.team.web;


import com.osk.team.domain.Club;
import com.osk.team.service.ClubService;
import com.osk.team.service.MemberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/reportList")
public class ClubReportListHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");
        MemberService memberService = (MemberService) request.getServletContext().getAttribute("memberService");

        try {
            List<Club> clubs = null;
            clubs = clubService.getReports();

            request.setAttribute("clubs", clubs);
            request.setAttribute("members", memberService.list(null));
            response.setContentType("text/html;charset=UTF-8");
            request.getRequestDispatcher("/jsp/club/reportList.jsp").include(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
