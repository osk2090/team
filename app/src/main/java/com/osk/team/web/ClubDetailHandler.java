package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.domain.Photo;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/detail")
public class ClubDetailHandler extends HttpServlet {

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>클럽</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>클럽 정보</h1>");

        out.print("<p><a href='detailSearch'>참여</a></p>");
        out.print("<p><a href='club.html'>생성</a></p>");

        try {
            int no = Integer.parseInt(request.getParameter("no").trim());

            Club c = clubService.get(no);
            if (c == null) {
                out.println("<p>해당 번호의 클럽이 없습니다.</p>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
            out.println("<form action='update' method='post' enctype='multipart/form-data'>");
            out.println("<table border='1'>");
            out.println("<tbody>");
            out.printf("<tr><th>번호</th>"
                    + " <td><input type='text' name='no' value='%d' readonly></td></tr>\n", c.getNo());
            out.printf("<tr><th>방장</th> <td>%s</td></tr>\n", c.getWriter().getName());
            out.printf("<tr><th>도착지</th>"
                    + " <td><input name='title' type='text' value='%s'></td></tr>\n", c.getArrive());
            out.printf("<tr><th>가는날</th> <td>%s</td></tr>\n", formatter.format(c.getStartDate()));
            out.printf("<tr><th>오는날</th> <td>%s</td></tr>\n", formatter.format(c.getEndDate()));
            out.printf("<tr><th>제목</th> <td>%s</td></tr>\n", c.getTitle());
            out.printf("<tr><th>내용</th> <td>%s</td></tr>\n", c.getContent());
            out.printf("<tr><th>인원수</th> <td>%s</td></tr>\n", c.getTotal());

//            List<Photo> p = new ArrayList<>();
//            p.add(new Photo());
//            c.setPhotos(Collections.singletonList(p));
//
//            System.out.println(c.getPhotos());

            out.printf("<tr><th>사진</th> <td>"
                            + "<a href='%s'><img src='%s'></a><br>"
                            + "<input name='photo' type='file'></td></tr>\n",
                    c.getPhotos() != null ? "../upload/" + c.getPhotos() : "",
                    c.getPhotos() != null ? "../upload/" + c.getPhotos() + "_254*178.jpg" : "../images/person_80x80.jpg");

            out.println("</tbody>");

            Member loginUser = (Member) request.getSession().getAttribute("loginUser");
            if (loginUser != null && c.getWriter().getNo() == loginUser.getNo()) {
                out.println("<tfoot>");
                out.println("<tr><td colspan='2'>");
                out.println("<input type='submit' value='변경'> "
                        + "<a href='delete?no=" + c.getNo() + "'>삭제</a> ");
                out.println("</td></tr>");
                out.println("</tfoot>");
            }

            out.println("</table>");
            out.println("</form>");


        } catch (Exception e) {
            throw new ServletException(e);
        }
        out.println("<p><a href='list'>목록</a></p>");

        out.println("</body>");
        out.println("</html>");
    }
}
