package com.osk.team.service;

import com.osk.team.domain.Board;
import com.osk.team.domain.Qna;

import java.util.List;

public interface QnaService {

    int add(Qna qna) throws Exception;

    List<Qna> list() throws Exception;

    Qna get(int m_qno) throws Exception;

    int update(Qna qna) throws Exception;

    int delete(int m_qno) throws Exception;

}
