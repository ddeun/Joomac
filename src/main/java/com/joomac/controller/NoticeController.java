package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.joomac.dao.NoticeDAO;
import com.joomac.dto.NoticeDTO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeDAO noticeDAO;
    
    @GetMapping("/write")
    public String writeForm() {
        return "notice/write";
    }
    @PostMapping("/write")
    public String write(
            NoticeDTO dto,
            @RequestParam(value = "nimage", required = false) MultipartFile file
    ) {

        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setNimage(fileName);
        }

        noticeDAO.insertNotice(dto);
        return "redirect:/notice/list";
    }
    
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
