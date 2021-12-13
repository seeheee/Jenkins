package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.StockVO;
import org.zerock.service.StockService;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/stock/*")
public class StockController {
    private StockService service;

    @GetMapping("/list")
    public void list(Model model){
        log.info("list");
        model.addAttribute("list", service.getList());
    }

    @RequestMapping(value="register", method = {RequestMethod.GET, RequestMethod.POST})
    public String register(StockVO stock, RedirectAttributes rttr) {
        log.info("register: " + stock);
        service.register(stock);
        rttr.addFlashAttribute("result", stock.getInventoryid());
        return "redirect:/stock/list";
    }
}
