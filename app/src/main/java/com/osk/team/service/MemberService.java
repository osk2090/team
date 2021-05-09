package com.osk.team.service;

import com.osk.team.domain.Member;

import java.util.List;

public interface MemberService {
    int add(Member member) throws Exception;

    List<Member> findByMember(int mno) throws Exception;

    Member get(String email, String password) throws Exception;

    Member get(int mno) throws Exception;

    int update(Member member) throws Exception;

    int delete(int mno) throws Exception;

    //탈퇴 기능
}
