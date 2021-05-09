package com.osk.team.web;

import com.osk.team.domain.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@SuppressWarnings("serial")
@WebServlet("/userInfo")
public class UserInfoHandler extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Member member = (Member) request.getSession().getAttribute("loginUser");
        if (member == null) {
            out.println("로그인 하지 않았습니다!");
            return;
        }

        out.printf("이름: %s\n", member.getMname());
        out.printf("이메일: %s\n", member.getMemail());
        out.printf("암호: %d\n", member.getMpwd());
        out.printf("사진: %s\n", member.getMphoto());
        out.printf("성별: %d\n", member.getMgender());
        out.printf("생년월일: %d\n", member.getMbirth());
        out.printf("전화번호: %d\n", member.getMtel());
        out.printf("제제횟수: %d\n", member.getMcnt());
    }
}