package com.L_CSS.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ChatroomDao;
import com.L_CSS.dao.GroupBuyDao;
import com.L_CSS.dto.ChatroomDto;
import com.L_CSS.dto.GbpeopleDto;
import com.L_CSS.dto.GbreserveDto;
import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.dto.ProductDto;
import com.google.gson.Gson;

@Service
public class GroupBuyService {

	@Autowired
	private HttpSession session;

	@Autowired
	GroupBuyDao gbdao;

	@Autowired
	ChatroomDao chdao;

	// 공동구매 게시판
	public ModelAndView getGroupBuyInfo() {
		System.out.println("AdminService.insertCompany() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<GbreserveDto> groupBuyList = gbdao.getGroupBuyInfo();

		mav.addObject("groupBuyList", groupBuyList);
		mav.setViewName("GroupBuy/GroupBuyBoard");
		return mav;
	}

	// 공동구매 글 작성 페이지
	public ModelAndView getPdType() {
		System.out.println("AdminService.getPdType() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<String> productType = gbdao.getPdType();

		String loginId = (String) session.getAttribute("loginId");

		String region = gbdao.getAddress(loginId);

		if (region != null) {
			region = region.split("_")[1].split(" ")[0];
		}

		mav.addObject("region", region);
		mav.addObject("productType", productType);
		mav.setViewName("GroupBuy/GroupBuyWrite_form");
		return mav;
	}

	// 구매할 상품 종류 선택
	public String getPdname(String pdtype) {
		System.out.println("AdminService.getPdname() 호출");

		ArrayList<ProductDto> getProductList = gbdao.getProduct(pdtype);

		Gson gson = new Gson();
		String productList = gson.toJson(getProductList);
		return productList;
	}

	// 공동구매 글 작성
	public ModelAndView insertGroupBuy(GroupBuyDto groupBuy) {
		System.out.println("AdminService.insertGroupBuy() 호출");
		ModelAndView mav = new ModelAndView();

		// 코드생성
		String max = gbdao.getmax();
		String gbcode = "GB";
		if (max == null) {
			gbcode = gbcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				gbcode = gbcode + "00" + maxCode;
			} else if (maxCode < 100) {
				gbcode = gbcode + "0" + maxCode;
			} else {
				gbcode = gbcode + maxCode;
			}

		}
		System.out.println(gbcode);
		groupBuy.setGbcode(gbcode);

		// 아이디
		String loginId = (String) session.getAttribute("loginId");
		groupBuy.setGbmid(loginId);

		// 줄바꿈, 띄어쓰기 처리
		String gbcomment = groupBuy.getGbcomment();
		gbcomment = gbcomment.replaceAll(" ", "&nbsp;");
		gbcomment = gbcomment.replaceAll("\r\n", "<br>");
		groupBuy.setGbcomment(gbcomment);

		System.out.println(groupBuy);

		gbdao.insertGroupBuy(groupBuy);

		mav.setViewName("redirect:/groupBuyBoard");
		return mav;
	}

	// 공동구매 글 상세보기
	public ModelAndView getGroupBuy(String gbcode) {
		System.out.println("AdminService.getGroupBuy() 호출");
		ModelAndView mav = new ModelAndView();

		GbreserveDto gbreserve = gbdao.getGroupbuy(gbcode);

		// 줄바꿈, 띄어쓰기 처리
		String gbcomment = gbreserve.getGbcomment();
		gbcomment = gbcomment.replaceAll("&nbsp;", " ");
		gbcomment = gbcomment.replaceAll("<br>", "\r\n");
		gbreserve.setGbcomment(gbcomment);

		ArrayList<GbpeopleDto> gbpeopleList = gbdao.getGbpeople(gbcode);
		System.out.println(gbpeopleList);

		mav.addObject("gbreserve", gbreserve);
		mav.addObject("gbpeopleList", gbpeopleList);
		mav.setViewName("GroupBuy/GroupBuyBoardView");
		return mav;
	}

	// 공동구매 참여 요청
	public ModelAndView insertGbpeople(GbpeopleDto gbInfo) {
		System.out.println("AdminService.insertGbpeople() 호출");
		ModelAndView mav = new ModelAndView();

		gbdao.insertGbpeopleDto(gbInfo);

		mav.setViewName("redirect:/chatRoom?gbcode=" + gbInfo.getGpgbcode());

		return mav;
	}

	// 공동구매 게시글, 정보 삭제
	public ModelAndView deleteGroupBuyBoard(String gbcode) {
		System.out.println("AdminService.deleteGroupBuyBoard() 호출");
		ModelAndView mav = new ModelAndView();

		gbdao.deleteChatRoom(gbcode);
		gbdao.deleteGbpeople(gbcode);
		gbdao.deleteGroupBuy(gbcode);

		mav.setViewName("redirect:/groupBuyBoard");
		return mav;
	}

	// 공동구매 채팅방 참여 요청
	public ModelAndView groupBuyChatRoom(String gbcode) {
		System.out.println("AdminService.groupBuyChatRoom() 호출");
		ModelAndView mav = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		GbreserveDto gbreserve = gbdao.getGroupbuy(gbcode);
		ArrayList<GbpeopleDto> gbpeopleList = gbdao.getGbpeople(gbcode);
		ArrayList<ChatroomDto> chattingLog = chdao.getChatroom(gbcode);
		GbpeopleDto myGbInfo = gbdao.getGbInfo(gbcode, loginId);

		mav.addObject("myGbInfo", myGbInfo);
		mav.addObject("gbpeopleList", gbpeopleList);
		mav.addObject("gbreserve", gbreserve);
		mav.addObject("chattingLog", chattingLog);
		mav.setViewName("GroupBuy/ChatRoom");
		return mav;
	}

	// 공동구매 탈퇴 요청
	public ModelAndView outGroupBuy(String gbcode) {
		System.out.println("AdminService.outGroupBuy() 호출");
		ModelAndView mav = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		gbdao.outGbpeople(gbcode, loginId);
		gbdao.outChatroom(gbcode, loginId);

		mav.setViewName("redirect:/");
		return mav;
	}

	public ModelAndView modGroupBuy(GroupBuyDto modGb) {
		System.out.println("AdminService.modGroupBuy() 호출");
		ModelAndView mav = new ModelAndView();

		// 줄바꿈, 띄어쓰기 처리
		String gbcomment = modGb.getGbcomment();
		gbcomment = gbcomment.replaceAll(" ", "&nbsp;");
		gbcomment = gbcomment.replaceAll("\r\n", "<br>");
		modGb.setGbcomment(gbcomment);

		gbdao.updateGroupBuy(modGb);

		mav.setViewName("redirect:/groupBuyBoardView?gbcode=" + modGb.getGbcode());

		return mav;
	}

}
