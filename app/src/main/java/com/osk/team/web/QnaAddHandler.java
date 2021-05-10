package com.osk.team.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.osk.team.domain.Board;
import com.osk.team.domain.Member;
import com.osk.team.domain.Qna;
import com.osk.team.service.BoardService;
import com.osk.team.service.QnaService;

@SuppressWarnings("serial")
@WebServlet("/qna/add")
public class QnaAddHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        QnaService qnaService = (QnaService) request.getServletContext().getAttribute("qnaService");

        Qna q = new Qna();

        request.setCharacterEncoding("UTF-8");

//        q.setM_qtitle(request.getParameter("title"));
//        q.setM_qcontent(request.getParameter("content"));

        // 작성자는 로그인 사용자이다.
        HttpServletRequest httpRequest = request;
        int loginUser = (int) httpRequest.getSession().getAttribute("loginUser");
//        q.setMno(loginUser);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>게시글 </title>");

        try {
            qnaService.add(q);

            out.println("<meta http-equiv='Refresh' content='1;url=list'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>QnA 등록</h1>");
            out.println("<p>QnA를 등록하였습니다.</p>");

        } catch (Exception e) {
            StringWriter strWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(strWriter);
            e.printStackTrace(printWriter);

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>QnA 등록 오류</h1>");
            out.printf("<pre>%s</pre>\n", strWriter.toString());
            out.println("<p><a href='list'>목록</a></p>");
        }

        out.println("</body>");
        out.println("</html>");
    }
}
