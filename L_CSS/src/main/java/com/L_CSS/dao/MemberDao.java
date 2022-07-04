package com.L_CSS.dao;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.MemberDto;

public interface MemberDao {

	int insertMember(MemberDto member);

	MemberDto memberLogin(@Param("mid")String mid,@Param("mpw")String mpw);

	MemberDto memberInfo(String loginId);

	

}
