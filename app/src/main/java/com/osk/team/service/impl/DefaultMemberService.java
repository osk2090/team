package com.osk.team.service.impl;

import com.osk.team.dao.MemberDao;
import com.osk.team.domain.Member;
import com.osk.team.service.MemberService;

import java.util.List;

public class DefaultMemberService implements MemberService {

    MemberDao memberDao;

    public DefaultMemberService(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public int add(Member member) throws Exception {
        return memberDao.insert(member);
    }

    @Override
    public List<Member> findByMember(int mno) throws Exception {
        return memberDao.findByNoMemberList(mno);
    }

    @Override
    public Member get(int mno) throws Exception {
        return memberDao.findByNo(mno);
    }

    @Override
    public int update(Member member) throws Exception {
        return memberDao.update(member);
    }

    @Override
    public int delete(int mno) throws Exception {
        return memberDao.delete(mno);
    }

    @Override
    public Member get(String email, String password) throws Exception {
        return null;
    }
}