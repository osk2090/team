package com.osk.team.dao;

import com.osk.team.domain.Club;
import com.osk.team.domain.Hotplace;

import java.util.List;

public interface HotplaceDao {

    int insert(Hotplace hotplace) throws Exception;

    List<Hotplace> findAll() throws Exception;

    Hotplace findByNo(int hno) throws Exception;

    int update(Hotplace hotplace) throws Exception;

    int delete(int hno) throws Exception;

}
