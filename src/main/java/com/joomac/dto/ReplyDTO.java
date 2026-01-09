package com.joomac.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
    private int rpno;
    private String rpcontent;
    private Date rpdate;
    private int mno;     // 답변 작성자 (관리자 or 회원)
    private Integer bno; // 게시판 댓글용
    private Integer qno; // 질문 답변용
}