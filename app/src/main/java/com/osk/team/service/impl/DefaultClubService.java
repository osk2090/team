package com.osk.team.service.impl;

import com.osk.team.dao.ClubDao;
import com.osk.team.domain.Club;
import com.osk.team.service.ClubService;

import java.util.List;

public class DefaultClubService implements ClubService {

    ClubDao clubDao;

    public DefaultClubService(ClubDao clubDao) {
        this.clubDao = clubDao;
    }

    @Override
    public int add(Club club) throws Exception {
        return clubDao.insert(club);
    }

    @Override
    //
    public List<Club> list() throws Exception {
        return clubDao.findAll();
    }

    @Override
    //현재클럽가입 인원
    public List<Club> listOfMember(int mno) throws Exception {
        return clubDao.findByMemberNo(mno);
    }

    @Override
    public Club get(int cno) throws Exception {
        return clubDao.findByNo(cno);
    }

    @Override
    public int update(Club club) throws Exception {
        return clubDao.update(club);
    }

    @Override
    public int delete(int cno) throws Exception {
        return clubDao.delete(cno);
    }

    @Override
    public int deleteMember(int mno) throws Exception {
        return clubDao.deleteByMemberNo(mno);
    }

    @Override
    public List<Club> search(String keyword) throws Exception {//새로 만듬
        return clubDao.findByKeyword(keyword);
    }

}
