package com.joomac.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class DeliveryDTO {
	private int dno;
	private String ddelivery;
	private String daddr;
	private Date ddate;
	private String dname;
	private int dprice;
	private String dpay;
	private int ono;
}
