package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.BoardDAO;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardDAO boardDAO;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", boardDAO.selectBoardList());
        return "board/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam int bno, Model model) {
        boardDAO.updateViewCount(bno);
        model.addAttribute("board", boardDAO.selectBoard(bno));
        return "board/detail";
    }
}
