package com.osk.team.dao;

import com.osk.team.domain.Club;

import java.util.List;

public interface ClubDao {

    int insert(Club club) throws Exception;


    Club findByNo(int cno) throws Exception;

    int update(Club club) throws Exception;

    int delete(int cno) throws Exception;

    List<Club> findByKeyword(String keyword) throws Exception;//새로만듬

//    List<Club> findAll() throws Exception;

    //    List<Club> findByMemberNo(int mno) throws Exception;

    //    int deleteByMemberNo(int mno) throws Exception;

    // 로그인 된 유저가 클럽 참여 -> 멤버 추가
}