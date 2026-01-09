package com.joomac.dto;

import lombok.Data;

@Data
public class QuestionDTO {
    private int qno;
    private String qtitle;
    private String qcontent;
    private String qanswer;
    private int mno;   // FK
}