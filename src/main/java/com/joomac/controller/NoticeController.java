package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.NoticeDAO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeDAO noticeDAO;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", noticeDAO.selectNoticeList());
        return "notice/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam int nno, Model model) {
        model.addAttribute("notice", noticeDAO.selectNotice(nno));
        return "notice/detail";
    }
}
