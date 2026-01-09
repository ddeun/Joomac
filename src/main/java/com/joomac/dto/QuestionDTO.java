package com.joomac.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QuestionDTO {
    private int qno;
    private String qtitle;
    private String qcontent;
    private int mno;   // FK
    private String qstatus;
    private Date qdate;
    private Date answer_date;
}