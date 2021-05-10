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
    //현재클럽가입 인원
    public List<Club> listOfMember() throws Exception {
        return clubDao.findByKeyword(null);
    }

    @Override
    public Club get(int no) throws Exception {
        return clubDao.findByNo(no);
    }

    @Override
    public int update(Club club) throws Exception {
        return clubDao.update(club);
    }

    @Override
    public int delete(int no) throws Exception {
        return clubDao.delete(no);
    }

    @Override
    public List<Club> search(String keyword) throws Exception {//새로 만듬
        return clubDao.findByKeyword(keyword);
    }

}
