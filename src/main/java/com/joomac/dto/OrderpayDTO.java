package com.joomac.dto;

import lombok.Data;

@Data
public class OrderpayDTO {
	private int ono;
	private int oprice;
	private String oaddr;
	private String opay;
	private String ostatus;
	private int mno;
}
