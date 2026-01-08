package com.joomac.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.MemberDAO;
import com.joomac.dto.MemberDTO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@GetMapping("/list")
    public String memberList(Model model) {
        List<MemberDTO> memberList = memberDAO.selectMemberList();
        model.addAttribute("memberList", memberList);
        return "admin/member/list";
    }
	
	@PostMapping("/delete")
	public String delete(@RequestParam("mno") int mno) {
		memberDAO.deleteMember(mno);
		return "redirect:/admin/member/list";
	}
	
}
