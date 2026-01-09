package com.joomac.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.joomac.dao.BoardDAO;
import com.joomac.dao.NoticeDAO;
import com.joomac.dto.BoardDTO;
import com.joomac.dto.NoticeDTO;

@Controller
public class MainController {

    @Autowired
    private NoticeDAO noticeDAO;

    @Autowired
    private BoardDAO boardDAO;

    @GetMapping("/")
    public String main(Model model) {

        List<NoticeDTO> noticeList = noticeDAO.selectRecentNotices(3);
        List<BoardDTO> freeList = boardDAO.selectRecentBoards(3);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("freeList", freeList);

        return "main";
    }
}