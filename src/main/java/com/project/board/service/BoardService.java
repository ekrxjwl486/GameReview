package com.project.board.service;

import com.project.board.vo.BoardVo;
import com.project.board.vo.DeclarationVo;
import com.project.board.vo.GameListVo;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public interface BoardService {

    void GameInsert() throws IOException;

    int GameListCount();

    List<GameListVo> GameListSelect(HashMap<String, Object> map);

    List<GameListVo> GameListSearchS(HashMap<String, Object> map);

    int GameListSCount(HashMap<String, Object> map);

    int GameSCount(HashMap<String, Object> map);

    List<GameListVo> GameListS(HashMap<String, Object> map);

    GameListVo getGame(HashMap<String, Object> map);

    List<BoardVo> getBoardList(HashMap<String, Object> map);

    BoardVo getBoard(HashMap<String, Object> map);

    void boardInsert(HashMap<String, Object> map);

    void boardUpdate(HashMap<String, Object> map);

    int boardCount(HashMap<String, Object> map);

    List<GameListVo> getGameList();

    int boardCheck(HashMap<String, Object> map);

    BoardVo goodGame(HashMap<String, Object> map);

    void boardDelete(HashMap<String, Object> map);

    int declarationInsert(HashMap<String, Object> map);

    DeclarationVo getDeclaration(HashMap<String, Object> map);

    void declarationProcess(HashMap<String, Object> map);

    List<GameListVo> getTopGame();

    List<GameListVo> getGenreGame(HashMap<String, Object> map);

    List<DeclarationVo> getDeclarationList(HashMap<String, Object> map);
}
