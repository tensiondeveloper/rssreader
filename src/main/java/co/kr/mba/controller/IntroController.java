package co.kr.mba.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/intro")
public class IntroController {

	
	
	
	@RequestMapping(value = "greeting", method = RequestMethod.GET)
	public ModelAndView greeting(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		System.out.println("greeting");
		mav.setViewName("intro/greeting");
		return mav;
	}
	@RequestMapping(value = "greeting2", method = RequestMethod.GET)
	public ModelAndView greeting2(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/greeting2");
		return mav;
	}
	@RequestMapping(value = "greeting3", method = RequestMethod.GET)
	public ModelAndView greeting3(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/greeting3");
		return mav;
	}
	@RequestMapping(value = "introunive", method = RequestMethod.GET)
	public ModelAndView introunive(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/introunive");
		return mav;
	}
	@RequestMapping(value = "visionmission", method = RequestMethod.GET)
	public ModelAndView visionmission(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/visionmission");
		return mav;
	}
	@RequestMapping(value = "donation", method = RequestMethod.GET)
	public ModelAndView donation(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/donation");
		return mav;
	}
	@RequestMapping(value = "group", method = RequestMethod.GET)
	public ModelAndView group(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/group");
		return mav;
	}
	@RequestMapping(value = "regulation", method = RequestMethod.GET)
	public ModelAndView regulation(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/regulation");
		return mav;
	}
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public ModelAndView map(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("intro/map");
		return mav;
	}
}
