package thuc.ute.admin_crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String home() {
        return "web/home";
    }
    
    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "<h1>Test OK - Spring Boot hoạt động!</h1>";
    }
    
    @GetMapping("/test-jsp")
    public String testJsp() {
        return "test-simple";
    }
}