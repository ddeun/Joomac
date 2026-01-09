package com.joomac.controller;

import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.joomac.dao.ProductDAO;
import com.joomac.dto.ProductDTO;

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
    public String detail(@RequestParam("pno") int pno, Model model) {
        ProductDTO dto = productDAO.selectProductDetail(pno);
        model.addAttribute("product", dto);
        return "product/detail";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "product/write";
    }

    @PostMapping("/write")
    public String write(ProductDTO dto, @RequestParam("uploadfile") MultipartFile file) throws Exception {
        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setPimage(fileName);

            String uploadPath = "C:\\Springboot\\Joomac\\src\\main\\resources\\static\\images\\";
            File saveFolder = new File(uploadPath);
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            File saveFile = new File(uploadPath + fileName);
            file.transferTo(saveFile);
        }

        productDAO.insertProduct(dto);
        return "redirect:/product/list";
    }

    @GetMapping("/updateform")
    public String updateform(@RequestParam("pno") int pno, Model model) {
        ProductDTO dto = productDAO.selectProductDetail(pno);
        model.addAttribute("update", dto);
        return "product/updateform";
    }

    @PostMapping("/update")
    public String update(ProductDTO dto, @RequestParam("uploadfile") MultipartFile file) throws Exception {
        if (file != null && !file.isEmpty()) {
            // 새 이미지 업로드
            String fileName = file.getOriginalFilename();
            dto.setPimage(fileName);

            String uploadPath = "C:\\Springboot\\Joomac\\src\\main\\resources\\static\\images\\";
            File saveFolder = new File(uploadPath);
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            File saveFile = new File(uploadPath + fileName);
            file.transferTo(saveFile);

        } else {
            // 새 이미지가 없으면 기존 이미지 유지
            ProductDTO existing = productDAO.selectProductDetail(dto.getPno());
            dto.setPimage(existing.getPimage());
        }

        productDAO.updateProduct(dto);
        return "redirect:/product/detail?pno=" + dto.getPno();
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("pno") int pno) {
        productDAO.deleteProduct(pno);
        return "redirect:/product/list";
    }
} 
