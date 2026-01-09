package com.joomac.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joomac.dao.QuestionDAO;
import com.joomac.dao.ReplyDAO;
import com.joomac.dto.MemberDTO;
import com.joomac.dto.QuestionDTO;
import com.joomac.dto.ReplyDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private ReplyDAO replyDAO;

    @Autowired
    private QuestionDAO questionDAO;
    
    @GetMapping("/write")
    public String writeForm(HttpSession session) {
    	MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/member/login";  
        return "question/write";
    }
    
    @PostMapping("/write")
    public String write(QuestionDTO dto, HttpSession session) {
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if(user==null) return "redirect:/member/login";
        
        dto.setMno(user.getMno());
        questionDAO.insertQuestion(dto);
        return "redirect:/question/list";
    }
    
    @GetMapping("/list")
    public String list(HttpSession session, Model model) {

        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/member/login";

        String auth = user.getMauth();

        List<QuestionDTO> list;

        if (auth != null && auth.toUpperCase().contains("ADMIN")) {
            list = questionDAO.selectAllQuestion();
        } else {
            list = questionDAO.selectQuestionByMember(user.getMno());
        }

        model.addAttribute("list", list);
        return "question/list";
    }

    
    @GetMapping("/detail")
    public String detail(@RequestParam("qno") int qno, Model model) {
        QuestionDTO question = questionDAO.selectQuestion(qno);
        ReplyDTO reply = replyDAO.selectQuestionReply(qno);

        model.addAttribute("question", question);
        model.addAttribute("reply", reply);

        return "question/detail";
    }

    
    @PostMapping("/answer")
    public String insertQuestionReply(ReplyDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/member/login";

        if (loginUser.getMauth() == null || !loginUser.getMauth().toUpperCase().contains("ADMIN")) {
            return "redirect:/question/list";
        }

        dto.setMno(loginUser.getMno());

        replyDAO.insertQuestionReply(dto);

        questionDAO.updateAnswerStatus(dto.getQno());

        return "redirect:/question/detail?qno=" + dto.getQno();
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("qno") int qno, HttpSession session, Model model) {

        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/member/login";

        QuestionDTO question = questionDAO.selectQuestion(qno);
        ReplyDTO reply = replyDAO.selectQuestionReply(qno);

        boolean isOwner = (question != null && question.getMno() == user.getMno());
        if (!isOwner || reply != null) {
            return "redirect:/question/detail?qno=" + qno;
        }

        model.addAttribute("question", question);
        return "question/update";
    }

    @PostMapping("/update")
    public String update(QuestionDTO dto, HttpSession session) {

        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/member/login";

        QuestionDTO origin = questionDAO.selectQuestion(dto.getQno());
        ReplyDTO reply = replyDAO.selectQuestionReply(dto.getQno());

        boolean isOwner = (origin != null && origin.getMno() == user.getMno());
        if (!isOwner || reply != null) {
            return "redirect:/question/detail?qno=" + dto.getQno();
        }

        questionDAO.updateQuestion(dto);
        return "redirect:/question/detail?qno=" + dto.getQno();
    }
}
