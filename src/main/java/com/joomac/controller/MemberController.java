package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joomac.dao.MemberDAO;
import com.joomac.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberDAO memberDAO;

    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(MemberDTO dto, HttpSession session) {
        MemberDTO loginUser = memberDAO.login(dto);
        session.setAttribute("mno", loginUser.getMno());

        session.setAttribute("loginUser", loginUser);
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main/main";
    }

    @GetMapping("/join")
    public String joinForm() {
        return "member/join";
    }

    @PostMapping("/join")
    public String join(MemberDTO dto) {
        memberDAO.insertMember(dto);
        return "redirect:/member/login";
    }
    
    @RequestMapping("/jusopopup")
    public String jusopopup() {
    	return "member/jusopopup";
    }
    
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        MemberDTO member = memberDAO.selectMember(loginUser.getMno());
        model.addAttribute("member", member);

        return "member/mypage";
    }
    
    @PostMapping("/update")
    public String update(MemberDTO dto, HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        dto.setMno(loginUser.getMno());

        memberDAO.updateMember(dto);

        MemberDTO updatedUser = memberDAO.selectMember(loginUser.getMno());
        session.setAttribute("loginUser", updatedUser);

        return "redirect:/member/mypage";
    }
    
    @PostMapping("/withdraw")
    public String withdraw(HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        memberDAO.deleteMember(loginUser.getMno());
        session.invalidate();

        return "redirect:/";
    }
}