package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.CartDAO;
import com.joomac.dto.CartDTO;
import com.joomac.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartDAO cartDAO;

    @PostMapping("/add")
    public String add(CartDTO dto, HttpSession session) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/member/login";

        cartDAO.insertCart(dto);
        return "redirect:/cart/list";
    }

    @GetMapping("/list")
    public String cartList(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        
        if(member == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("cartList", cartDAO.selectCartList(member.getMno()));
        return "cart/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam int cno) {
        cartDAO.deleteCart(cno);
        return "redirect:/cart/list";
    }

}
