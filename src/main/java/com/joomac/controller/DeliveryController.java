package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.DeliveryDAO;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

    @Autowired
    private DeliveryDAO deliveryDAO;

    @GetMapping("/info")
    public String info(@RequestParam int ono, Model model) {
        model.addAttribute("delivery", deliveryDAO.selectDelivery(ono));
        return "delivery/info";
    }
}