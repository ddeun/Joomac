package com.joomac.controller;

import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.joomac.dao.ProductDAO;
import com.joomac.dto.ProductDTO;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductDAO productDAO;

    private final String uploadPath = "C:\\Springboot\\Joomac\\src\\main\\resources\\static\\images\\";

    @GetMapping("/list")
    public String list(@RequestParam(value = "category", required = false) String category, Model model) {
        if (category == null || category.isEmpty()) {
            model.addAttribute("list", productDAO.selectProductList());
        } else {
            model.addAttribute("list", productDAO.selectByCategory(category));
            model.addAttribute("category", category);
        }
        return "product/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("pno") int pno, Model model) {
        model.addAttribute("product", productDAO.selectProductDetail(pno));
        return "product/detail";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "product/write";
    }

    @PostMapping("/write")
    public String write(ProductDTO dto,
                        @RequestParam("uploadfile1") MultipartFile file1,
                        @RequestParam("uploadfile2") MultipartFile file2) throws Exception {

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        if (!file1.isEmpty()) {
            String filename1 = file1.getOriginalFilename();
            File saveFile1 = new File(uploadDir, filename1);
            file1.transferTo(saveFile1);
            dto.setPimage(filename1);
        }

        if (!file2.isEmpty()) {
            String filename2 = file2.getOriginalFilename();
            File saveFile2 = new File(uploadDir, filename2);
            file2.transferTo(saveFile2);
            dto.setPpairingImage(filename2);
        }

        productDAO.insertProduct(dto);
        return "redirect:/product/list";
    }


    @GetMapping("/updateform")
    public String updateForm(@RequestParam("pno") int pno, Model model) {
        model.addAttribute("update", productDAO.selectProductDetail(pno));
        return "product/updateform";
    }

    @PostMapping("/update")
    public String update(ProductDTO dto,
                         @RequestParam("uploadfile1") MultipartFile file1,
                         @RequestParam("uploadfile2") MultipartFile file2) throws Exception {

        ProductDTO existing = productDAO.selectProductDetail(dto.getPno());

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        if (!file1.isEmpty()) {
            String filename1 = file1.getOriginalFilename();
            File saveFile1 = new File(uploadDir, filename1);
            file1.transferTo(saveFile1);
            dto.setPimage(filename1);
        }

        if (!file2.isEmpty()) {
            String filename2 = file2.getOriginalFilename();
            File saveFile2 = new File(uploadDir, filename2);
            file2.transferTo(saveFile2);
            dto.setPpairingImage(filename2);
        }

        productDAO.updateProduct(dto);
        return "redirect:/product/detail?pno=" + dto.getPno();
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("pno") int pno) {
        productDAO.deleteProduct(pno);
        return "redirect:/product/list";
    }
}
