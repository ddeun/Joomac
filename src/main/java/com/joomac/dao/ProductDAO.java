package com.joomac.dao;

import java.util.List;
import com.joomac.dto.ProductDTO;

public interface ProductDAO {

    int insertProduct(ProductDTO dto);

    ProductDTO selectProduct(int pno);

    List<ProductDTO> selectProductList();

    List<ProductDTO> selectByCategory(String pcategory);

    int updateProduct(ProductDTO dto);

    int deleteProduct(int pno);
}
