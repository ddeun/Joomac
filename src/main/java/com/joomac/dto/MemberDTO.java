package com.joomac.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int mno;
	private String mname;
	private String mid;
	private String mpasswd;
	private String mzipcode;
	private String maddr;
	private String maddrdetail;
	private Date mbirth;
	private String mgender;
	private String mtel;
	private String memail;
	private Date mdate;
	private String mauth;
}
