package com.joomac.dto;

import java.sql.Date;

//import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
    private int bno;
    private String btitle;
    private String bcontent;
    private Date bdate;
    private int bview;
    private String bip;
    private String bimage;
    //private MultipartFile bfile;
    private int mno;   // FK
}