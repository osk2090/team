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

@SuppressWarnings("serial")
@WebServlet("/club/delete")
public class ClubDeleteHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");
        MemberService memberService = (MemberService) request.getServletContext().getAttribute("memberService");

        try {
            int no = Integer.parseInt(request.getParameter("no"));

            Club oldClub = clubService.get(no);
            if (oldClub == null) {
                throw new Exception("해당 번호의 클럽이 없습니다.");
            }

            Member loginUser = (Member) request.getSession().getAttribute("loginUser");

            if (oldClub.getWriter().getNo() != loginUser.getNo() && loginUser.getPower() == 0) {
                throw new Exception("삭제 권한이 없습니다.");
            }

            //운영자가 삭제를 하면 제제횟수+1 과 해당 글을 신고 처리 완료로 한다
//            if (loginUser.getPower() == 1) {
//                Member member = memberService.get(no);
//                setCount(member);//제제 횟수 증가 메서드 사용
//                memberService.add(member);
//            }

            clubService.delete(no);
            response.sendRedirect("list");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void setCount(Member member) {
        if (member.getCount() == 0) {
            member.setCount(1);
        } else if (member.getCount() > 1) {
            member.setCount(member.getCount() + 1);
        }
    }
}
