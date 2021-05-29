package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@SuppressWarnings("serial")
@WebServlet("/club/report")
public class ClubReportHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        try {
            int no = Integer.parseInt(request.getParameter("no"));
            int clubWriterNo = Integer.parseInt(request.getParameter("clubWriterNo"));
            String reason = request.getParameter("reason");//신고 사유
            int result = Integer.parseInt(request.getParameter("result"));

            Club club = new Club();

            System.out.println(no);
            System.out.println(clubWriterNo);

            HashMap<String, Object> params = new HashMap<>();
            params.put("memberNo", clubWriterNo);//클럽글 작성자 번호
            params.put("clubNo", no);
            params.put("reason", reason);
            params.put("result", result);
            //신고처리는 디폴트 맴퍼에서 0처리

            clubService.addWithReport(params);//신고하는 글과 작성자 번호 보내기

            response.sendRedirect("list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
