package com.osk.team.dao;

import com.osk.team.domain.Member;

import java.util.List;
import java.util.Map;

public interface MemberDao {

        int insert(Member member) throws Exception;

//        List<Member> findByNoMemberList(int no) throws Exception;

//        Member findByNo(int no) throws Exception;

        Member findByEmailPassword(Map<String,Object> params) throws Exception;

        int update(Member member) throws Exception;

        int delete(int no) throws Exception;
    }