package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.ChatroomDto;

public interface ChatroomDao {

	void insertSendMsg(ChatroomDto sendMsg);

	ArrayList<ChatroomDto> getChatroom(String gbcode);

	
}
