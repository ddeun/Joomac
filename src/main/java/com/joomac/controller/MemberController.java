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

    /* =====================
       로그인 / 로그아웃
       ===================== */

    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(MemberDTO dto, HttpSession session) {

        MemberDTO loginUser = memberDAO.login(dto);

        if (loginUser == null) {
            session.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "member/login";
        }
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    /* =====================
       회원가입
       ===================== */

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

    /* =====================
       내정보
       ===================== */

    @GetMapping("/mypage")
    public String myinfo(HttpSession session, Model model) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }

        MemberDTO dto = memberDAO.selectMember(loginUser.getMno());
        model.addAttribute("dto", dto);

        return "member/mypage";
    }

    /* =====================
       비밀번호 확인
       ===================== */

    @GetMapping("/passwordcheck")
    public String passwordcheckForm(HttpSession session) {

        if (session.getAttribute("loginUser") == null) {
            return "redirect:/member/login";
        }

        return "member/passwordcheck";
    }

    @PostMapping("/passwordcheck")
    public String passwordcheck(MemberDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }

        MemberDTO result =
            memberDAO.passwordCheck(loginUser.getMno(), dto.getMpasswd());

        if (result == null) {
            session.setAttribute("pwError", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/passwordcheck";
        }

        session.setAttribute("pwChecked", true);

        String nextAction = (String) session.getAttribute("nextAction");

        if ("withdraw".equals(nextAction)) {
            return "redirect:/member/withdraw";
        }

        return "redirect:/member/update";
    }


    /* =====================
       회원정보 수정
       ===================== */

    @GetMapping("/update")
    public String editForm(HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }
        
        if (session.getAttribute("pwChecked") == null) {
            return "redirect:/member/passwordcheck";
        }

        MemberDTO member = memberDAO.selectMember(loginUser.getMno());
        session.setAttribute("edit", member);

        return "member/update";
    }

    @PostMapping("/update")
    public String edit(MemberDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }

        dto.setMno(loginUser.getMno());
        memberDAO.updateMember(dto);
        
        session.removeAttribute("pwChecked");

        // ✅ 수정 후 내정보로 이동
        return "redirect:/member/mypage";
    }
    
    @GetMapping("/withdraw")
    public String withdrawForm(HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }

        session.setAttribute("nextAction", "withdraw");

        if (session.getAttribute("pwChecked") == null) {
            return "redirect:/member/passwordcheck";
        }

        return "member/withdraw";
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
