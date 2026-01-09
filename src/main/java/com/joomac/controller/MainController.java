package com.joomac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.joomac.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

    @GetMapping("/") // 첫 접속 주소
    public String main(HttpSession session, Model model) {
        return "main/main"; // views/main/main.jsp
    }
}