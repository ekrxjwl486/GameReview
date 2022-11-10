package com.project.board.dao.impl;

import com.project.board.dao.BoardDao;
import com.project.board.vo.BoardVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<BoardVo> getBoardList(HashMap<String, Object> map) {
        List<BoardVo> boardList = sqlSession.selectList("Board.BoardList",map.get("menu_id"));
        return boardList;
    }


    @Override
    public void insertboard(BoardVo boardVo) {
        sqlSession.insert("Board.InsertBoard", boardVo);
    }
    @Override
    public BoardVo getBoard(HashMap<String, Object> map) {
        BoardVo boardVo = sqlSession.selectOne("Board.Board", map);
        return boardVo;
    }
    @Override
    public List<BoardVo> getlist(String menu_id) {
        List<BoardVo> boardlist = sqlSession.selectList("Board.BoardList", menu_id);
        return boardlist;
    }

}