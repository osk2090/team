package com.osk.team.dao;

import com.osk.team.domain.Member;

import java.util.List;

public interface MemberDao {

        int insert(Member member) throws Exception;

        List<Member> findByNoMemberList(int mno) throws Exception;

        Member findByNo(int mno) throws Exception;

        int update(Member member) throws Exception;

        int delete(int mno) throws Exception;
    }