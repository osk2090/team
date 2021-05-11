package com.osk.team.dao;

import com.osk.team.domain.Hotplace;

import java.util.List;

public interface DiscountDao {

    int insert(Hotplace hotplace) throws Exception;

    List<Hotplace> findAll() throws Exception;

    Hotplace findByNo(int no) throws Exception;

    int update(Hotplace hotplace) throws Exception;

    int delete(int no) throws Exception;

}
