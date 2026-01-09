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

import com.joomac.dao.NoticeDAO;
import com.joomac.dto.NoticeDTO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeDAO noticeDAO;
    
    @GetMapping("/write")
    public String writeForm() {
        return "notice/write";
    }
    @PostMapping("/write")
    public String write(
            NoticeDTO dto,
            @RequestParam(value = "uploadfile", required = false) MultipartFile file
    ) throws Exception{

        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setNimage(fileName);
            
            String uploadPath = "C:\\joomac_upload\\";
            
            File saveFolder = new File(uploadPath);
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            File saveFile = new File(uploadPath + fileName);
            file.transferTo(saveFile); // 여기서 실제로 파일을 저장합니다!
        }
     

        noticeDAO.insertNotice(dto);
        return "redirect:/notice/list";
    }
    
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("NoticeList", noticeDAO.selectNoticeList());
        return "notice/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("nno") int nno, Model model) {
        // DAO의 메서드명이 selectNotice인지 selectNoticeDetail인지 확인 후 호출!
        NoticeDTO dto = noticeDAO.selectNotice(nno); 
        model.addAttribute("notice", dto);
        return "notice/detail";
    }
    
 // 수정 페이지 이동
    @GetMapping("/update")
    public String updateForm(@RequestParam("nno") int nno, Model model) {
        model.addAttribute("notice", noticeDAO.selectNotice(nno));
        return "notice/update";
    }

    // 수정 처리 (파일 업로드 포함)
    @PostMapping("/update")
    public String update(NoticeDTO dto, @RequestParam(value="uploadFile", required=false) MultipartFile file) throws Exception {
        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            dto.setNimage(fileName);
            
            String uploadPath = "C:\\joomac_upload\\";
            file.transferTo(new File(uploadPath + fileName));
        }else {
            // 새 이미지가 없으면 기존 이미지 유지
            NoticeDTO existing = noticeDAO.selectNotice(dto.getNno());
            dto.setNimage(existing.getNimage());
        }
        // 기존 이미지가 있고 새 파일을 선택 안 했을 때의 처리는 보통 
        // hidden으로 기존 파일명을 보내서 유지시킵니다.
        
        noticeDAO.updateNotice(dto);
        return "redirect:/notice/detail?nno=" + dto.getNno();
    }

    // 삭제 처리
    @GetMapping("/delete")
    public String delete(@RequestParam("nno") int nno) {
        noticeDAO.deleteNotice(nno);
        return "redirect:/notice/list";
    }
    
}
