package com.osk.team.dao;

import com.osk.team.domain.Faq;

import java.util.List;

public interface FaqDao {

    int insert(Faq Faq) throws Exception;

    List<Faq> findAll() throws Exception;

    Faq findByNo(int qno) throws Exception;

    int update(Faq Faq) throws Exception;

    int delete(int m_qno) throws Exception;

    // 로그인 된 유저가 클럽 참여 -> 멤버 추가
}
