package com.joomac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.ProductDAO;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductDAO productDAO;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", productDAO.selectProductList());
        return "product/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam int pno, Model model) {
        model.addAttribute("product", productDAO.selectProduct(pno));
        return "product/detail";
    }
}
