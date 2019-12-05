package com.example.huan.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author huan
 */
@Controller
@RequestMapping("/model")
public class ModelController {

    @RequestMapping("toIndex")
    public String toIndex(){
        return "index";
    }
}
