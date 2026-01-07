package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    @PostMapping("/write")
    public String write(
            BoardDTO dto,
            @RequestParam("uploadfile") MultipartFile file
    ) {

        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setBimage(fileName);
        }

        boardDAO.insertBoard(dto);
        return "redirect:/board/list";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam int bno) {
        boardDAO.deleteBoard(bno);
        return "redirect:/board/list";
    }
}
