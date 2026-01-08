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

import com.joomac.dao.BoardDAO;
import com.joomac.dto.BoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardDAO boardDAO;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("boardList", boardDAO.selectBoardList());
        return "board/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("bno") int bno, Model model) {
        boardDAO.updateViewCount(bno);
        model.addAttribute("board", boardDAO.selectBoard(bno));
        return "board/detail";
    }
    
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    @PostMapping("/write")
    public String write(
            BoardDTO dto,
            @RequestParam("uploadfile") MultipartFile file,
            HttpServletRequest request,
            HttpSession session
    ) throws Exception{
    	Object mnoObj = session.getAttribute("mno");
    	
    	String ip = request.getRemoteAddr();
    	
    	if (mnoObj == null) {
            return "redirect:/login"; 
        }
    	
    	int mno = (int) mnoObj;
        dto.setMno(mno);
    	
    	dto.setBip(ip);
    	
    	if (file != null && !file.isEmpty()) {
    	    String fileName = file.getOriginalFilename();
    	    dto.setBimage(fileName);

    	    String uploadPath = "C:\\joomac_upload\\"; 

    	    File saveFolder = new File(uploadPath);
    	    if (!saveFolder.exists()) {
    	        saveFolder.mkdirs(); 
    	    }

    	    File saveFile = new File(uploadPath + fileName);
    	    file.transferTo(saveFile);
    	    
    	}
        boardDAO.insertBoard(dto);
        return "redirect:/board/list";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("bno") int bno) {
        boardDAO.deleteBoard(bno);
        return "redirect:/board/list";
    }
    
    @GetMapping("/update")
    public String updateForm(@RequestParam("bno") int bno, Model model) {
        // 기존 글 내용을 가져와서 수정 페이지에 보여줍니다.
        model.addAttribute("board", boardDAO.selectBoard(bno));
        return "board/update";
    }

    @PostMapping("/update")
    public String update(
            BoardDTO dto,
            @RequestParam("uploadfile") MultipartFile file,
            HttpServletRequest request
    ) throws Exception {
        
    	dto.setBip(request.getRemoteAddr());
        
        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setBimage(fileName);

            String uploadPath = "C:\\joomac_upload\\";
            File saveFile = new File(uploadPath + fileName);
            file.transferTo(saveFile);
        }
        
        // DB 업데이트 실행
        boardDAO.updateBoard(dto);
        
        // 수정한 글의 상세보기 페이지로 다시 이동
        return "redirect:/board/detail?bno=" + dto.getBno();
    }
}
