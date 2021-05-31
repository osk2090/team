package com.osk.team.web;

import com.osk.team.domain.Member;
import com.osk.team.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

  MemberService memberService;

  public AuthController(MemberService memberService) {
    this.memberService = memberService;
  }

  @GetMapping("/login_form")
  public void form() throws Exception {
  }

  @PostMapping("/login")
  public String login(
          String email, String password, String saveEmail,
          HttpSession session, HttpServletResponse response) throws Exception {
    if (saveEmail != null) {
      Cookie cookie = new Cookie("email", email);
      cookie.setMaxAge(60 * 60 * 24 * 5);
      response.addCookie(cookie);
    } else {
      Cookie cookie = new Cookie("email", "");
      cookie.setMaxAge(0);
      response.addCookie(cookie);
    }

    Member member = memberService.get(email, password);

    if (member == null) {
      session.invalidate();
      return "login_fail";
    } else {
      session.setAttribute("loginUser", member);

      if (member.getPower() == 0) {
        return "login_success";
      } else if (member.getPower() == 1) {
        return "login_admin_success";
      }
      return "login_success";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) throws Exception {
    session.invalidate();
    return "redirect:login_form";
  }

  @GetMapping("/user_Info")
  public void userInfo() throws Exception {
  }
}