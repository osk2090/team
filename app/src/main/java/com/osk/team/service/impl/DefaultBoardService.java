package com.osk.team.service.impl;



import com.osk.team.dao.BoardDao;
import com.osk.team.domain.Board;
import com.osk.team.service.BoardService;

import java.util.List;

public class DefaultBoardService implements BoardService {

    BoardDao boardDao;

    public DefaultBoardService(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    @Override
    public int add(Board board) throws Exception {
        return boardDao.insert(board);
    }

    @Override
    public List<Board> list() throws Exception {
        return boardDao.findByKeyword(null);
    }

    @Override
    public Board get(int bno) throws Exception {
        Board board = boardDao.findByNo(bno);
        if (board != null) {
            boardDao.updateViewCount(bno);
        }
        return board;
    }

    @Override
    public int update(Board board) throws Exception {
        return boardDao.update(board);
    }

    @Override
    public int delete(int bno) throws Exception {
        return boardDao.delete(bno);
    }

    @Override
    public List<Board> search(String keyword) throws Exception {
        return boardDao.findByKeyword(keyword);
    }
}