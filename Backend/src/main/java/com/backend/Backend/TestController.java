package com.backend.Backend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestController {

    @GetMapping("/hola")
    public String hola() {
        return "¡Hola! El backend de DepoTito está funcionando correctamente.";
    }

    // Este endpoint te pedirá login (marce / 1234)
    @GetMapping("/protegido")
    public String protegido() {
        return "Has accedido a un área protegida. ¡Felicidades, la seguridad funciona!";
    }
}
