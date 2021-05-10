package com.osk.team.service.impl;

import com.osk.team.dao.QnaDao;
import com.osk.team.domain.Qna;
import com.osk.team.service.QnaService;

import java.util.List;

public class DefaultQnaService implements QnaService {

    QnaDao qnaDao;

    public DefaultQnaService(QnaDao qnaDao) {
        this.qnaDao = qnaDao;
    }

    @Override
    public int add(Qna qna) throws Exception {
        return qnaDao.insert(qna);
    }

    @Override
    public List<Qna> list() throws Exception {
        return qnaDao.findAll();
    }

    @Override
    public Qna get(int no) throws Exception {
        return qnaDao.findByNo(no);
    }

    @Override
    public int update(Qna qna) throws Exception {
        return qnaDao.update(qna);
    }

    @Override
    public int delete(int no) throws Exception {
        return qnaDao.delete(no);
    }
}
