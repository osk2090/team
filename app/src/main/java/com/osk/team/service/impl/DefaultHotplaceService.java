package com.osk.team.service.impl;

import com.osk.team.dao.HotplaceDao;
import com.osk.team.domain.Hotplace;
import com.osk.team.service.HotplaceService;

import java.util.List;

public class DefaultHotplaceService implements HotplaceService {

    HotplaceDao hotplaceDao;

    public DefaultHotplaceService(HotplaceDao hotplaceDao) {
        this.hotplaceDao = hotplaceDao;
    }

    //핫플레이스 등록 업무
    @Override
    public int add(Hotplace hotplace) throws Exception {
        return hotplaceDao.insert(hotplace);
    }

    //핫플레이스 목록 전체 조회 업무
    @Override
    public List<Hotplace> listAll() throws Exception {
        return hotplaceDao.findAll();
    }

    //핫플레이스 상세 조회 업무
    @Override
    public Hotplace get(int hno) throws Exception {
        Hotplace hotplace = hotplaceDao.findByNo(hno);
        return hotplace;
    }

    //핫플레이스 수정 업무
    @Override
    public int update(Hotplace hotplace) throws Exception {
        return hotplaceDao.update(hotplace);
    }

    //핫플에이스 삭제 업무
    @Override
    public int delete(int hno) throws Exception {
        return hotplaceDao.delete(hno);
    }
}