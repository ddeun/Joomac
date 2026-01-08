package com.joomac.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeDTO {
    private int nno;
    private String ntitle;
    private String ncontent;
    private String nimage;
    private Date ndate;
}