package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.service.ClubService;
import com.osk.team.service.MemberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/detail")
public class ClubDetailHandler extends HttpServlet {

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");
        MemberService memberService = (MemberService) request.getServletContext().getAttribute("memberService");

        Member loginUser = (Member) request.getSession().getAttribute("loginUser");

        try {
            int no = Integer.parseInt(request.getParameter("no"));

            Club c = clubService.get(no);
            List<Member> clubM = clubService.getMembers(no);
            int size = clubM.size();

            System.out.println(clubM);
            System.out.println(clubM.size());

            if (c == null) {
                throw new Exception("해당 번호의 클럽이 없습니다.");
            }

            if (loginUser == null) {
                throw new Exception("로그인 후 이용가능합니다.");
            }

            request.setAttribute("club", c);
            request.setAttribute("members", memberService.list(null));
            request.setAttribute("clubMembers", clubM);
            request.setAttribute("size", size);

            response.setContentType("text/html;charset=UTF-8");
            request.getRequestDispatcher("/jsp/club/detail.jsp").include(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
