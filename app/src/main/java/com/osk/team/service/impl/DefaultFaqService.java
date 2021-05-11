package com.osk.team.service.impl;

import com.osk.team.dao.FaqDao;
import com.osk.team.domain.Faq;
import com.osk.team.service.FaqService;

import java.util.List;

public class DefaultFaqService implements FaqService {

    FaqDao FaqDao;

    public DefaultFaqService(FaqDao FaqDao) {
        this.FaqDao = FaqDao;
    }

    @Override
    public int add(Faq Faq) throws Exception {
        return FaqDao.insert(Faq);
    }

    @Override
    public List<Faq> listAll() throws Exception {
        return null;
    }

//    @Override
//    public List<Faq> list() throws Exception {
//        return FaqDao.findAll();
//    }

    @Override
    public Faq get(int no) throws Exception {
        return FaqDao.findByNo(no);
    }

    @Override
    public int update(Faq Faq) throws Exception {
        return FaqDao.update(Faq);
    }

    @Override
    public int delete(int no) throws Exception {
        return FaqDao.delete(no);
    }
}
