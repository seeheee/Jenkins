package org.zerock.mapper;
import org.zerock.domain.BoardVO;
import org.zerock.domain.StockVO;

import java.util.List;


public interface StockMapper {
    public List<StockVO> getList();

    public void insertSelectKey(StockVO stock);

    public StockVO read(Long inventoryid);
}
