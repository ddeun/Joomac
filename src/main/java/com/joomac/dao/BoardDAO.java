package com.joomac.dao;

import java.util.List;
import com.joomac.dto.BoardDTO;

public interface BoardDAO {
    int insertBoard(BoardDTO dto);
    BoardDTO selectBoard(int bno);
    List<BoardDTO> selectBoardList();
    int updateBoard(BoardDTO dto);
    int deleteBoard(int bno);
    int updateViewCount(int bno);
    List<BoardDTO> selectRecentBoards(int limit);
}