package com.osk.team.service;

import com.osk.team.domain.Board;
import com.osk.team.domain.Club;

import java.util.List;

public interface ClubService {

    int add(Club club) throws Exception;

    List<Club> listOfMember() throws Exception;//현재 참여 멤버

    Club get(int no) throws Exception;

    List<Club> search(String keyword) throws Exception;

    int update(Club club) throws Exception;

    int delete(int no) throws Exception;

    // 로그인 된 유저가 클럽 참여 -> 멤버 추가
}
