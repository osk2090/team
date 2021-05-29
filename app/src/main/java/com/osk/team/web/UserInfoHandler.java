package com.osk.team.web;

import com.osk.team.domain.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UserInfoHandler {

    @RequestMapping("/userInfo")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/jsp/user_info.jsp";
    }
}