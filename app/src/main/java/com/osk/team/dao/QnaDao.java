package com.osk.team.dao;

import com.osk.team.domain.Qna;

import java.util.List;

public interface QnaDao {

    int insert(Qna qna) throws Exception;

    List<Qna> findAll() throws Exception;

    Qna findByNo(int qno) throws Exception;

    int update(Qna qna) throws Exception;

    int delete(int m_qno) throws Exception;

    // 로그인 된 유저가 클럽 참여 -> 멤버 추가
}
