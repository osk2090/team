package com.osk.team.web;

import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/club/deleteMember")
public class ClubDeleteMemberHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        try {
            int no = Integer.parseInt(request.getParameter("no"));

            clubService.deleteMember(no);
            response.sendRedirect("list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
