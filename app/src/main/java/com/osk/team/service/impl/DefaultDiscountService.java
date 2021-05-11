package com.osk.team.service.impl;

import com.osk.team.dao.DiscountDao;
import com.osk.team.domain.Discount;
import com.osk.team.service.DiscountService;

import java.util.List;

public class DefaultDiscountService implements DiscountService {

    DiscountDao DiscountDao;

    public DefaultDiscountService(DiscountDao DiscountDao) {
        this.DiscountDao = DiscountDao;
    }

    @Override
    public int add(Discount Discount) throws Exception {
        return 0;
    }

    @Override
    public int update(Discount Discount) throws Exception {
        return 0;
    }

    @Override
    public List<Discount> listAll() throws Exception {
        return null;
    }

//    @Override
//    public List<Discount> list() throws Exception {
//        return DiscountDao.findAll();
//    }

    @Override
    public Discount get(int no) throws Exception {
        return null;
    }

    @Override
    public int delete(int no) throws Exception {
        return DiscountDao.delete(no);
    }
}
