package com.L_CSS.dao;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.MemberDto;

public interface MemberDao {

	int InsertMember(MemberDto member);

	MemberDto MemberLogin(@Param("mid")String mid,@Param("mpw")String mpw);

	MemberDto MemberInfo(String loginId);

}