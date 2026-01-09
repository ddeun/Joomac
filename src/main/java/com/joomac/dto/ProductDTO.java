package com.joomac.dto;

import lombok.Data;

@Data
public class ProductDTO {
    private int pno;
    private String pname;
    private int pprice;
    private float palcohol;
    private String psize;
    private String pimage;        // 상품 이미지
    private float pscore;
    private String pcategory;
    private int pcount;
    private String pdetail;
    private String ppairing;      // 추천 안주 텍스트
    private String ppairingImage; // 추천 안주 이미지 파일명
    private int mno;
}
