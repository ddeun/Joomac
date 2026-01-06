package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.BoardDAO;
import com.joomac.dto.BoardDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardDAO boardDAO;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("boardList", boardDAO.selectBoardList());
        return "board/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam int bno, Model model) {
        boardDAO.updateViewCount(bno);
        model.addAttribute("board", boardDAO.selectBoard(bno));
        return "board/detail";
    }
    
 // 1. 작성 페이지 이동
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    // 2. 작성 데이터 처리
    @PostMapping("/write")
    public String write(BoardDTO dto) {
        boardDAO.insertBoard(dto);
        return "redirect:/board/list"; // 저장 후 목록으로 이동
    }
    @GetMapping("/delete")
    public String delete(@RequestParam int bno) {
        boardDAO.deleteBoard(bno);
        return "redirect:/board/list";
    }
}
