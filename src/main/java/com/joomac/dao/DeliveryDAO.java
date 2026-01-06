package com.joomac.dao;

import com.joomac.dto.DeliveryDTO;

public interface DeliveryDAO {

    int insertDelivery(DeliveryDTO dto);

    DeliveryDTO selectDelivery(int ono);
}