package com.joomac.dao;

import java.util.List;
import com.joomac.dto.ProductDTO;

public interface ProductDAO {

    List<ProductDTO> selectProductList();
    ProductDTO selectProductDetail(int pno);
    List<ProductDTO> selectByCategory(String category);
    void insertProduct(ProductDTO dto);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int pno);
}
