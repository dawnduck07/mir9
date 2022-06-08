package com.naedam.admin.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.naedam.admin.chat.handler.ChattingHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class ChatConfig implements WebSocketConfigurer {

	private final ChattingHandler chatHandler;
	
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	
    	log.info("config 진입");
        registry.addHandler(chatHandler, "ws/admin/chat/chat")
        .setAllowedOrigins("http://*:8080", "http://*.*.*.*:8080")
        .withSockJS();
    }
	
}
