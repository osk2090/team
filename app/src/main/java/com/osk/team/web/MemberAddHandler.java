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
import com.osk.team.domain.Member;
import com.osk.team.service.MemberService;

@SuppressWarnings("serial")
@WebServlet("/member/add")
public class MemberAddHandler extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MemberService memberService = (MemberService) request.getServletContext().getAttribute("memberService");

        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();


        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>회원 가입</title>");
        try {
            out.println("<meta http-equiv='Refresh' content='1;url=list'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>회원 가입</h1>");

            Member m = new Member();
            m.setName(request.getParameter("mname"));
            m.setEmail(request.getParameter("memail"));
            m.setPassword(request.getParameter("mpassword"));
            m.setPhoto(request.getParameter("mphoto"));
            m.setTel(request.getIntHeader("mtel"));
            m.setBirth(Date.valueOf(request.getParameter("mbirhth")));
            m.setGender(request.getIntHeader("mgender"));
            m.setPower(0);//강제 일반회원으로 주입

            memberService.add(m);

            out.println("<p>회원가입을 완료했습니다.</p>");

        } catch (Exception e) {
            StringWriter strWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(strWriter);
            e.printStackTrace(printWriter);
            out.println(strWriter.toString());

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>회원가입 오류!</h1>");
            out.printf("<pre>%s</pre>\n", strWriter.toString());
            out.println("<p><a href='list'>회원 목록</a></p>");
        }

        out.println("</body>");
        out.println("</html>");
    }

}

