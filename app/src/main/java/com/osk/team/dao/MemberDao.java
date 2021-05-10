package com.osk.team.dao;

import com.osk.team.domain.Member;

import java.util.List;

public interface MemberDao {

        int insert(Member member) throws Exception;

        List<Member> findByNoMemberList(int no) throws Exception;

        Member findByNo(int no) throws Exception;

        int update(Member member) throws Exception;

        int delete(int no) throws Exception;
    }