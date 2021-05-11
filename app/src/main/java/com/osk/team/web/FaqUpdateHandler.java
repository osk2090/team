package main.java.com.osk.team.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.osk.team.domain.Faq;
import com.osk.team.domain.Member;
import com.osk.team.service.FaqService;

@SuppressWarnings("serial")
@WebServlet("/Faq/update")
public class FaqUpdateHandler extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    FaqService FaqService =
        (FaqService) request.getServletContext().getAttribute("FaqService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Faq 변경</title>");

    try {
      request.setCharacterEncoding("UTF-8");
      int no = Integer.parseInt(request.getParameter("no"));

      Faq oldFaq = FaqService.get(no);
      if (oldFaq == null) {
        throw new Exception("해당 번호의 게시글이 없습니다.");
      }

      Member loginUser = (Member) request.getSession().getAttribute("loginUser");
      // if (oldBoard.getMember_no() != loginUser.getNo()) {
      // throw new Exception("변경 권한이 없습니다!");
      // }

      Faq Faq = new Faq();
      Faq.setNo(oldFaq.getNo());
      // board.setBtitle(request.getParameter("title"));
      // board.setBcontent(request.getParameter("content"));
      FaqService.update(Faq);

      out.println("<meta http-equiv='Refresh' content='1;url=list'>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Faq 변경</h1>");
      out.println("<p>Faq를 변경하였습니다.</p>");

    } catch (Exception e) {
      StringWriter strWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(strWriter);
      e.printStackTrace(printWriter);

      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Faq 변경오류</h1>");
      out.printf("<p>%s</p>\n", e.getMessage());
      out.printf("<pre>%s</pre>\n", strWriter.toString());
      out.println("<p><a href='list'>목록</a></p>");
    }

    out.println("</body>");
    out.println("</html>");

  }
}
