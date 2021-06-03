package com.osk.team.dao;

import com.osk.team.domain.Discount;

import java.util.List;

public interface DiscountDao {

  int insert(Discount discount) throws Exception;

  List<Discount> findByKeyword(String keyword) throws Exception;

  Discount findByNo(int no) throws Exception;

  int update(Discount discount) throws Exception;

  int updateViewCount(int no) throws Exception;

  int delete(int dno) throws Exception;

}