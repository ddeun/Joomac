package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joomac.dao.OrderpayDAO;
import com.joomac.dto.MemberDTO;
import com.joomac.dto.OrderpayDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderpayController {

    @Autowired
    private OrderpayDAO orderpayDAO;

    @PostMapping("/create")
    public String create(OrderpayDTO dto, HttpSession session) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        dto.setMno(user.getMno());

        orderpayDAO.insertOrder(dto);
        return "redirect:/order/list";
    }

    @GetMapping("/list")
    public String list(HttpSession session, Model model) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        model.addAttribute("list", orderpayDAO.selectOrderByMember(user.getMno()));
        return "orderpay/list";
    }
}