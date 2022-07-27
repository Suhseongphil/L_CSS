package com.L_CSS.chat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.L_CSS.dao.ChatroomDao;
import com.L_CSS.dto.ChatroomDto;
import com.google.gson.Gson;

public class ChatRoom extends TextWebSocketHandler {

	@Autowired
	ChatroomDao chdao;

	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("채팅방 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("채팅방 종료");
		System.out.println("session.getId() : " + session.getId());
		sessionList.remove(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("채팅방 저장");
		System.out.println("message.getPayload() : " + message.getPayload());
		System.out.println("session.getId() : " + session.getId());

		Gson gson = new Gson();
		ChatroomDto sendMsg = gson.fromJson(message.getPayload(), ChatroomDto.class);
		System.out.println(sendMsg);
		chdao.insertSendMsg(sendMsg);

		for (int i = 0; i < sessionList.size(); i++) {
			if (!sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(sendMsg)));
			}
		}
	}
}
