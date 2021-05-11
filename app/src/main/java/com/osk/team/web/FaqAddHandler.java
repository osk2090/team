package com.osk.team.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.osk.team.domain.Faq;
import com.osk.team.service.FaqService;

@SuppressWarnings("serial")
@WebServlet("/Faq/add")
public class FaqAddHandler extends HttpServlet {


  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    FaqService FaqServce =
        (FaqService) request.getServletContext().getAttribute("FaqService");

    Faq h = new Faq();

    request.setCharacterEncoding("UTF-8");
    //private int no;//게시판 번호
    //private String title;//게시판 제목
    //private String content;//게시판 내용
    //private Date registeredDate;//작성일

    h.setTitle(request.getParameter("title"));
    h.setContent(request.getParameter("content"));
//    h.setDate(Date.valueOf(request.getParameter("registerDate")));

    HttpServletRequest httpRequest = request;
    int loginUser = (int) httpRequest.getSession().getAttribute("loginUser");// 회원번호로 받기
    h.setNo(loginUser);

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Faq 등록</title>");

    try {
      // FaqService.add(h);

      out.println("<meta http-equiv='Refresh' content='1;url=list'>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Faq 등록</h1>");
      out.println("<p>Faq 등록했습니다.</p>");
    } catch (Exception e) {
      StringWriter strWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(strWriter);
      e.printStackTrace(printWriter);

      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Faq 등록 오류</h1>");
      out.printf("<pre>%s</pre>\n", strWriter.toString());
      out.println("<p><a href='list'>Faq 목록</a></p>");
    }

    out.println("</body>");
    out.println("</html>");
  }
}
