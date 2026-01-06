package com.joomac.dao;

import java.util.List;
import com.joomac.dto.OrderpayDTO;

public interface OrderpayDAO {

    int insertOrder(OrderpayDTO dto);

    OrderpayDTO selectOrder(int ono);

    List<OrderpayDTO> selectOrderByMember(int mno);

    int updateStatus(OrderpayDTO dto);
}