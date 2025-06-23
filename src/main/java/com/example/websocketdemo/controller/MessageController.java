package com.example.websocketdemo.controller;

import com.example.websocketdemo.service.MessageHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class MessageController {

    @Autowired
    private MessageHandler messageHandler;

    @PostMapping("/send")
    public ResponseEntity<String> sendMessage(@RequestBody Map<String, String> payload) {
        String message = payload.get("message");
        messageHandler.broadcast(message);
        return ResponseEntity.ok("Message sent to all subscribers.");
    }
}
