package org.zerock.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.StockVO;
import org.zerock.mapper.StockMapper;

import java.util.List;
@Log4j
@Service
//@AllArgsConstructor
public class StockServiceImpl implements StockService{

    @Setter(onMethod_=@Autowired)
    private StockMapper mapper;

    @Override
    public void register(StockVO stock){
//        log.info("register....." + board);
        mapper.insertSelectKey(stock);
    }

    @Override
    public List<StockVO> getList() {
        log.info("StockVO.....");
        return mapper.getList();
    }


    @Override
    public StockVO get(Long inventoryid) {
//        log.info("get....." + bno);
        return mapper.read(inventoryid);
    }
}
