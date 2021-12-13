package org.zerock.service;

import org.zerock.domain.StockVO;
import java.util.List;

public interface StockService {

    public void register(StockVO stock);

    public List<StockVO> getList();

    public StockVO get(Long inventoryid);

}
