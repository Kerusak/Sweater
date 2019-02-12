package com.example.sweater.service;

import com.example.sweater.domain.Message;
import com.example.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<Message> findAllMessage(Pageable pageable) {
        return messageRepo.findAll(pageable);
    }

    public void save(Message message) {
        messageRepo.save(message);
    }

    public Page<Message> findByTag(String filter, Pageable pageable) {
        return messageRepo.findByTag(filter, pageable);
    }

}
