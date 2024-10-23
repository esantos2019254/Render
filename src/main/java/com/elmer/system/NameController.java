package com.elmer.system;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NameController {

    @GetMapping("/nombre")
    public String getName() {
        return "Hola! Soy Elmer Santos.";
    }
}
