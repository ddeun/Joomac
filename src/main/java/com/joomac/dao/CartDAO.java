package com.joomac.dao;

import java.util.List;
import com.joomac.dto.CartDTO;

public interface CartDAO {

    int insertCart(CartDTO dto);

    List<CartDTO> selectCartList(int mno);

    int updateCart(CartDTO dto);

    int deleteCart(int cno);
}