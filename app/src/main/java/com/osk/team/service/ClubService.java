package com.osk.team.service;

import com.osk.team.domain.Club;

import java.util.List;

public interface ClubService {

    int add(Club club) throws Exception;

    List<Club> list() throws Exception;

    List<Club> listOfMember(int mno) throws Exception;

    Club get(int cno) throws Exception;

    int update(Club club) throws Exception;

    int delete(int cno) throws Exception;

    int deleteMember(int mno) throws Exception;

    // 로그인 된 유저가 클럽 참여 -> 멤버 추가
}
