package com.hphfarm.www.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.ManagerDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.service.BoardService;
import com.hphfarm.www.service.FarmService;
import com.hphfarm.www.service.ManagerService;
import com.hphfarm.www.service.MemberService;
import com.hphfarm.www.service.ProductService;
import com.hphfarm.www.service.WeatherService;

@Controller
public class MainController {

	@Autowired
	FarmService farmService;
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	@Autowired
	ManagerService managerService;
	// =========================== 한희태 ===========================

	// 고객센터 1:1문의
	@RequestMapping("/customer/inquiry")
	public String inquiry() {
		return "customer/inquiry";
	}
	
	// 1:1 문의 보내기
	@RequestMapping("/customer/send_inquiry")
	public String send_inquiry(MemberDto mDto, Model model) {
		int result = memberService.insert_inquiry(mDto);
		model.addAttribute("result", result);
		return "customer/inquiry";
	}
	// 고객센터 faq
	@RequestMapping("/customer/faq")
	public String faq() {
		return "customer/faq";
	}

	// =========================== 황선필 ===========================

	@Autowired
	ProductService productService;
	
	// =========================== 최건호 ===========================

	@Autowired
	WeatherService weatherservice;

	// 메인 페이지
	@RequestMapping("/main")
	public String main(Model model) {
		// 한희태
		// 메인페이지 하단 인기있는 농장 TOP 7
		Map<String, Object> map = farmService.farmToplist();
		// 메인페이지 미니게시판
		List<BoardDto> bnDto = boardService.mainMiniNoitice();
		List<BoardDto> biDto = boardService.mainMiniInfo();
		List<BoardDto> trDto = boardService.mainMiniTrade();
		List<BoardDto> freeDto = boardService.mainMiniFree();
		List<BoardDto> userDto = boardService.mainMiniUser();
		List<BoardDto> farmerDto = boardService.mainMiniFarmer();
		// 메인페이지 월별 파종 추천 작물
		ManagerDto month = managerService.mainRecomment();
		List<ManagerDto> mDto = managerService.mainCrops();
		// 황선필
		// 메인 페이지(상품 리스트 나열 추가)
		List<ProductDto> plist = productService.selectMainProducts();
		model.addAttribute("plist", plist);
		model.addAttribute("map",map);
		model.addAttribute("bDto",bnDto);
		model.addAttribute("biDto",biDto);
		model.addAttribute("trDto",trDto);
		model.addAttribute("freeDto",freeDto);
		model.addAttribute("userDto",userDto);
		model.addAttribute("farmerDto",farmerDto);
		model.addAttribute("month",month);
		model.addAttribute("mDto",mDto);
		return "main";
	}

	// 날씨 API
	@ResponseBody
	@RequestMapping("/weatherApi")
	public String weatherApi(@RequestParam int pageNo) throws Exception {
		// 날씨데이터 가져오기
		String data = weatherservice.selectData(pageNo);
		return data;
	}
}
