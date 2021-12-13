package org.zerock.domain;
import lombok.Data;

@Data
public class StockVO {
    private Long inventoryid;
    private String inventoryname;
    private String limit;
    private String quantity;
}
