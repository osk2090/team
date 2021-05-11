package com.osk.team.service;

import com.osk.team.domain.Board;
import com.osk.team.domain.Discount;

import java.util.List;

public interface DiscountService {

    int add(Discount Discount) throws Exception;

    List<Discount> listAll() throws Exception;

    Discount get(int no) throws Exception;

    int update(Discount Discount) throws Exception;

    int delete(int no) throws Exception;

}
