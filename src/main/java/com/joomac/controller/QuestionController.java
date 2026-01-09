package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joomac.dao.QuestionDAO;
import com.joomac.dto.MemberDTO;
import com.joomac.dto.QuestionDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionDAO questionDAO;

    @PostMapping("/write")
    public String write(QuestionDTO dto, HttpSession session) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        dto.setMno(user.getMno());

        questionDAO.insertQuestion(dto);
        return "redirect:/question/list";
    }

    @GetMapping("/list")
    public String list(HttpSession session, Model model) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        model.addAttribute("list", questionDAO.selectQuestionByMember(user.getMno()));
        return "question/list";
    }
}
