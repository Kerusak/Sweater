package com.example.sweater.controller;

import com.example.sweater.domain.Message;
import com.example.sweater.domain.User;
import com.example.sweater.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public String greeting(Map<String, Object> model)
    {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false) String filter, Model model)
    {
        Iterable<Message> messages = messageService.findAllMessage();
        if(filter != null && !filter.isEmpty())
        {
            messages = messageService.findByTag(filter);
        }
        else
        {
            messages = messageService.findAllMessage();
        }
        model.addAttribute("messages",messages);
        model.addAttribute("filter", filter);
        return  "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Model model)
    {
        Message message = new Message(text, tag, user);
        messageService.addMessage(message);
        Iterable<Message> messages = messageService.findAllMessage();
        model.addAttribute("messages",messages);
        return "main";
    }
}
