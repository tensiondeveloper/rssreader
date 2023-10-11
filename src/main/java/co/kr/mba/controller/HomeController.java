package co.kr.mba.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import co.kr.mba.service.Apiservice;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	Apiservice service;
	
	@Autowired
	MappingJackson2JsonView jsonView;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
/*	@ModelAttribute("list")
	public HashMap<String, Object> listcall(){
		System.out.println("-----------------------------------------------------------------------------------------------");
		HashMap<String, Object> mav = new HashMap<String, Object>();
	
		
		return mav;
	}
	*/
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model,@RequestParam(value = "error", required = false,defaultValue = "") String error,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView mav = new ModelAndView();
		if(error.equals("y")) {
			mav.addObject("error", 1);
		}else {
			mav.addObject("error", "");
			System.out.println("로그인 되었습니다");
			
		}
		mav.setViewName("notemplet/login");
		
		return mav;
	}
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView join(Locale locale, Model model , @RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("pass1")String pass1) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("pwd", pass1);
		if(service.s_join_match(map) == 1) {
			mav.addObject("code", 1);
		}else {
			service.i_join(map);
			mav.addObject("code", 0);
		}
		mav.setView(jsonView);
		return mav;
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public ModelAndView mypage(Locale locale, Model model,Principal principal) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main/mypage");
		return mav;
	}
	@RequestMapping(value = "mypage", method = RequestMethod.POST)
	public ModelAndView mypagepost(Locale locale, Model model,Principal principal,@RequestParam("name")String name,@RequestParam("old_pwd")String old_pwd,@RequestParam("new_pwd")String new_pwd) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		map = service.select_user_all(principal.getName());
		if(!(old_pwd.equals(map.get("password").toString()))) {
			mav.addObject("error",3);
		}else {
			HashMap<String, Object> user = new HashMap<>();
			user.put("id", principal.getName());
			user.put("name", name);
			user.put("new_pwd", new_pwd);
			service.u_mypage(user);
			mav.addObject("error",0);
			
		}
		
		
		mav.setView(jsonView);
		return mav;
	}
	
	@ModelAttribute("sider")
	public HashMap<String, Object> listcall(Principal principal,HttpServletRequest request){
		HashMap<String, Object> mav = new HashMap<String, Object>();
		try {
			if(principal.getName() == null) {
			}else if(request.getRequestURI().contains("/receiveapi")|| request.getRequestURI().contains("/sendapi")){
			}else{
				/*System.out.println(principal.getName());
				System.out.println("-----------------------------------------------------------------------------------------------");
				HashMap<String, Object> map = new HashMap<>();
				map.put("id", principal.getName());
				ArrayList<Object> obj = new ArrayList<>();
				ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
				for (HashMap<String, Object> hashMap : list) {
					HashMap<String, Object> temp = new HashMap<>();
					
					temp.put("cate1_name", hashMap.get("cate1_name").toString());
					temp.put("cate1_seq", hashMap.get("cate1_seq").toString());
					ArrayList<HashMap<String, Object>> list2 =  service.s_cate2(hashMap.get("cate1_seq").toString());
					ArrayList<Object> obj2 = new ArrayList<>();
					for (HashMap<String, Object> hashMap2 : list2) {
						HashMap<String, Object> temp2 = new HashMap<>();
						temp2.put("cate2_name", hashMap2.get("cate2_name"));
						temp2.put("cate2_seq", hashMap2.get("cate2_seq"));
						System.out.println(hashMap2);
						temp2.put("list", service.s_cate3(hashMap2.get("cate2_seq").toString()));
						
						obj2.add(temp2);
					}
					temp.put("list", obj2);
					obj.add(temp);
				}
				
				mav.put("cate1_list_side", service.s_cate1(map));
				mav.put("rsslist_side", service.s_urllistnull(map));
				mav.put("lista", obj);
				return mav;*/
				HashMap<String, Object> map = new HashMap<>();
				map.put("id", principal.getName());
				ArrayList<Object> obj = new ArrayList<>();
				System.out.println("1");
				ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
				ArrayList<HashMap<String, Object>> list2 =  service.s_t2(map);
				ArrayList<HashMap<String, Object>> list3 =  service.s_t3(map);
				for (HashMap<String, Object> hashMap : list) {
					ArrayList<HashMap<String, Object>> parents = new ArrayList<>();
					
					for (HashMap<String, Object> hashMap2 : list2) {
						ArrayList<HashMap<String, Object>> parents2 = new ArrayList<>();
						if(hashMap.get("cate1_seq").equals(hashMap2.get("cate1_seq"))) {
							for (HashMap<String, Object> hashMap3 : list3) {
								if(hashMap2.get("cate2_seq").equals(hashMap3.get("cate2_seq"))) {
									parents2.add(hashMap3);
								}
								hashMap2.put("rss", parents2);
							}
							parents.add(hashMap2);
						}
					}
					hashMap.put("parents", parents);
				}
				System.out.println("5");
				mav.put("user", service.select_user_protec(principal.getName()));
				System.out.println("6");
				mav.put("lista", list);
				System.out.println("7");
				mav.put("cate1_list_side", service.s_cate1(map));
				System.out.println("8");
				mav.put("rsslist_side", service.s_urllistnull(map));
				System.out.println("9");
				return mav;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return mav;
	}
	@RequestMapping(value = "testapi", method = RequestMethod.GET)
	public ModelAndView testapi(Principal principal){
		ModelAndView mav = new ModelAndView();
	/*	try {
			if(principal.getName() == null) {
				System.out.println("널이여");
				
			}else {
				System.out.println(principal.getName());
				System.out.println("-----------------------------------------------------------------------------------------------");
				HashMap<String, Object> map = new HashMap<>();
				map.put("id", principal.getName());
				ArrayList<Object> obj = new ArrayList<>();
				ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
				for (HashMap<String, Object> hashMap : list) {
					HashMap<String, Object> temp = new HashMap<>();
					
					temp.put("cate1_name", hashMap.get("cate1_name").toString());
					temp.put("cate1_seq", hashMap.get("cate1_seq").toString());
					ArrayList<HashMap<String, Object>> list2 =  service.s_cate2(hashMap.get("cate1_seq").toString());
					ArrayList<Object> obj2 = new ArrayList<>();
					for (HashMap<String, Object> hashMap2 : list2) {
						HashMap<String, Object> temp2 = new HashMap<>();
						temp2.put("cate2_name", hashMap2.get("cate2_name"));
						temp2.put("cate2_seq", hashMap2.get("cate2_seq"));
						System.out.println(hashMap2);
						temp2.put("list", service.s_cate3(hashMap2.get("cate2_seq").toString()));
						
						obj2.add(temp2);
					}
					temp.put("list", obj2);
					obj.add(temp);
				}
				
				mav.addObject("cate1_list_side", service.s_cate1(map));
				mav.addObject("rsslist_side", service.s_urllistnull(map));
				mav.addObject("lista", obj);
				mav.setView(jsonView);
				return mav;
			}
		} catch (Exception e) {
		}*/

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", principal.getName());
		ArrayList<Object> obj = new ArrayList<>();
		ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
		ArrayList<HashMap<String, Object>> list2 =  service.s_t2(map);
		ArrayList<HashMap<String, Object>> list3 =  service.s_t3(map);
		for (HashMap<String, Object> hashMap : list) {
			ArrayList<HashMap<String, Object>> parents = new ArrayList<>();
			for (HashMap<String, Object> hashMap2 : list2) {
				ArrayList<HashMap<String, Object>> parents2 = new ArrayList<>();
				if(hashMap.get("cate1_seq").equals(hashMap2.get("cate1_seq"))) {
					for (HashMap<String, Object> hashMap3 : list3) {
						if(hashMap2.get("cate2_seq").equals(hashMap3.get("cate2_seq"))) {
							parents2.add(hashMap3);
						}
						hashMap2.put("rss", parents2);
					}
					parents.add(hashMap2);
				}
			}
			hashMap.put("parents", parents);
		}
		mav.addObject("lista", list);
		mav.setView(jsonView);
		return mav;
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model,Principal principal) {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", principal.getName());
		/*
		//mav.addObject("sidelist", service.s_urllist(map));
		
		ArrayList<Object> obj = new ArrayList<>();
		ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
		for (HashMap<String, Object> hashMap : list) {
			HashMap<String, Object> temp = new HashMap<>();
			
			temp.put("cate1_name", hashMap.get("cate1_name").toString());
			ArrayList<HashMap<String, Object>> list2 =  service.s_cate2(hashMap.get("cate1_seq").toString());
			ArrayList<Object> obj2 = new ArrayList<>();
			for (HashMap<String, Object> hashMap2 : list2) {
				HashMap<String, Object> temp2 = new HashMap<>();
				temp2.put("cate2_name", hashMap2.get("cate2_name"));
				System.out.println(hashMap2);
				temp2.put("list", service.s_cate3(hashMap2.get("cate2_seq").toString()));
				
				obj2.add(temp2);
			}
			temp.put("list", obj2);
			obj.add(temp);
		}
		mav.addObject("lista",obj);*/
		
		mav.addObject("rsslist", service.s_urllist(map));
		mav.setViewName("main/index");
		return mav;
		
	}
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView category(Locale locale, Model model,Principal principal) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("id", principal.getName());
		mav.addObject("cate1_list", service.s_cate1(map));
		mav.addObject("rsslist", service.s_urllistnull(map));
		mav.setViewName("main/category");
		return mav;
		
	}
	@RequestMapping(value = "/cate1_add", method = RequestMethod.POST)
	public ModelAndView cate1_add(Locale locale, Model model,@RequestParam("cate1")String cate1,Principal principal) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("cate1_name", cate1);
		map.put("id", principal.getName());
		service.i_cate1(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/rss_cate_add", method = RequestMethod.POST)
	public ModelAndView rss_cate_add(Locale locale, Model model,@RequestParam("cate2_seq")String cate2_seq,@RequestParam("list_seq")String list_seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("cate2_seq", cate2_seq);
		map.put("list_seq", list_seq);
		
		service.u_rsslist_addcate(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/cate2_add", method = RequestMethod.POST)
	public ModelAndView cate2_add(Locale locale, Model model,@RequestParam("cate1_seq")String cate1_seq,@RequestParam("cate2_name")String cate2_name) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("cate1_seq", cate1_seq);
		map.put("cate2_name", cate2_name);
		
		service.i_cate2(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	
	
	
	
	
	

	@RequestMapping(value = "/cate1_update", method = RequestMethod.POST)
	public ModelAndView cate1_update(Locale locale, Model model,@RequestParam("seq")String seq,@RequestParam("name")String name) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		map.put("name", name);
		
		service.u_cate1(map);
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/cate1_delete", method = RequestMethod.POST)
	public ModelAndView cate1_delete(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		service.u_urllist_cate1(map);
		service.d_cate2_cate1(map);
		service.d_cate1(map);
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/cate2_update", method = RequestMethod.POST)
	public ModelAndView cate2_update(Locale locale, Model model,@RequestParam("seq")String seq,@RequestParam("name")String name) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		map.put("name", name);
		
		service.u_cate2(map);
		mav.setView(jsonView);
		return mav;
		
	}
	
	@RequestMapping(value = "/cate2_delete", method = RequestMethod.POST)
	public ModelAndView cate2_delete(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		service.u_urllist_cate2(map);
		service.d_cate2(map);
		mav.setView(jsonView);
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/sub_catecall", method = RequestMethod.POST)
	public ModelAndView sub_catecall(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		
		
		
		mav.addObject("list", service.s_cate2(seq));
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		
		mav.setViewName("defalt/test");
		return mav;
		
	}
	
	@RequestMapping(value = "/file", method = RequestMethod.POST)
	public ModelAndView file(Locale local,@RequestParam("file")MultipartFile file,@RequestParam("dong")String dong,@RequestParam("ho")String ho) {
		ModelAndView mav = new ModelAndView();
		 try {
			 
			 
			 	ArrayList<HashMap<String, Object>> map = new ArrayList<>();
			 	map = service.s_test();
			 	
			 	for (HashMap<String, Object> hashMap : map) {
					String t_file = "C:\\Users\\mkthd\\Desktop\\greencore-sign\\"+hashMap.get("file").toString();
					String t_name= hashMap.get("name").toString();
					String t_dong= hashMap.get("dong").toString();
					String t_ho= hashMap.get("ho").toString();
					String t_phone= hashMap.get("phone").toString();
					String filename = t_dong+"_"+t_ho;
					
					
					   BufferedImage image1 = ImageIO.read(new File("C:\\Users\\mkthd\\Desktop\\1.jpg"));
					   BufferedImage image2 = ImageIO.read(new File(t_file));
					   
					   BufferedImage out = new BufferedImage(150, 75, image2.getType());
					   Graphics2D graphics2 = (Graphics2D) out.getGraphics();
					   graphics2.drawImage(image2,0,0,150,75,null);
					   
					   int width = image1.getWidth();
					   int height = image1.getHeight() ;

					   BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
					   Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

					   graphics.setBackground(Color.BLACK);
					   graphics.drawImage(image1, 0, 0, null);
					   
					   
					   Font f = new Font("맑은 고딕", Font.BOLD, 25);
					   graphics.setColor(Color.BLACK);
					   graphics.setFont(f);
					   graphics.drawString(t_name, 900,1755);
					   graphics.drawImage(out, 1110, 1715, null);
					   graphics.drawString(t_dong, 830,1862);
					   graphics.drawString(t_ho, 1000,1862);
					   t_phone = t_phone.substring(0, 3) + "-" + t_phone.substring(3, 7) + "-" + t_phone.substring(7);
					   graphics.drawString(t_phone, 900,1970);
					   ImageIO.write(mergedImage, "png", new File("C:\\Users\\mkthd\\Desktop\\test\\"+filename+".png"));
					   
				}
			 
			   
			   
			   
			  

			
			   
			   
			   
				
			  } catch (IOException ioe) {
			   ioe.printStackTrace();
			  }

		
		
		 mav.setViewName("redirect:/test");
		return mav;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ModelAndView all(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		mav.addObject("list", service.s_rss_all(map));
		mav.addObject("list_old", service.s_rss_all_old(map));
		mav.setViewName("main/allrss");
		return mav;
		
	}
	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public ModelAndView filter(Locale locale, Model model,Principal principal) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("id", principal.getName());
		mav.addObject("list", service.s_filter(map));
		mav.setViewName("main/filter");
		return mav;
		
	}
	@RequestMapping(value = "/filter_add", method = RequestMethod.POST)
	public ModelAndView filter_add(Locale locale, Model model,@RequestParam("seq")String seq,@RequestParam("lang")String lang) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		map.put("lang", lang);
		service.i_filter(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/filter_delete", method = RequestMethod.POST)
	public ModelAndView filter_delete(Locale locale, Model model,@RequestParam("seq")String seq,@RequestParam("lang")String lang) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		map.put("lang", lang);
		
		service.d_filter(map);
		mav.setView(jsonView);
		return mav;
		
	}
	
	
	@RequestMapping(value = "/rss/{seq}", method = RequestMethod.GET)
	public ModelAndView rss(Locale locale, Model model,@PathVariable String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		System.out.println("11");
		mav.addObject("sideractive", service.s_catesideractive(map));
		map.put("page", 0);
		map.put("rows", 10);
		mav.addObject("info", service.s_urllist_one(map));
		System.out.println("22");
		mav.addObject("list", service.s_rss_one(map));
		System.out.println("33");
		mav.addObject("list_old", service.s_rss_one_old(map));
		System.out.println("44");
		mav.addObject("list_old_sum", service.s_rss_one_oldsum(map));
		System.out.println("55");
		mav.setViewName("main/rss");
		return mav;
		
	}
	@RequestMapping(value = "/old_pages", method = RequestMethod.POST)
	public ModelAndView rss(Locale locale, Model model,@RequestParam("seq")int seq,@RequestParam("page")int page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		map.put("page", page);
		map.put("rows", 10);
		mav.addObject("scrol_list", service.s_rss_one_old(map));
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/updaterss", method = RequestMethod.POST)
	public ModelAndView updaterss(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		
		service.u_urllist_flag(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	//나중에 유저별로 나오도록 설정해야함 현재 사용하고 있지않아용
	@RequestMapping(value = "/side")
	public ModelAndView side(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		
		//mav.addObject("sidelist", service.s_urllist(map));
		
		ArrayList<Object> obj = new ArrayList<>();
		ArrayList<HashMap<String, Object>> list =  service.s_cate1(map);
		for (HashMap<String, Object> hashMap : list) {
			HashMap<String, Object> temp = new HashMap<>();
			
			temp.put("cate1_name", hashMap.get("cate1_name").toString());
			ArrayList<HashMap<String, Object>> list2 =  service.s_cate2(hashMap.get("cate1_seq").toString());
			ArrayList<Object> obj2 = new ArrayList<>();
			for (HashMap<String, Object> hashMap2 : list2) {
				HashMap<String, Object> temp2 = new HashMap<>();
				temp2.put("cate2_name", hashMap2.get("cate2_name"));
				temp2.put("list", service.s_cate3(hashMap2.get("cate2_seq").toString()));
				
				obj2.add(temp2);
			}
			temp.put("list", obj2);
			obj.add(temp);
		}
		mav.addObject("lista",obj);
		mav.setView(jsonView);
		return mav;
		
	}
	
	@RequestMapping(value = "/sendapi")
	public ModelAndView api(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		
	
		mav.addObject("list", service.s_urllist_send(map));
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/urladd")
	public ModelAndView urladd(Locale locale, Model model,@RequestParam("url")String url,@RequestParam("cate2_seq")String cate2_seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("rssurl", url);
		map.put("cate2_seq", cate2_seq);
		service.i_urllist(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/urldelete" , method = RequestMethod.POST)
	public ModelAndView urldelete(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		service.du_rss(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	@RequestMapping(value = "/urllistdelete" , method = RequestMethod.POST)
	public ModelAndView urllistdelete(Locale locale, Model model,@RequestParam("seq")String seq) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new  HashMap<>();
		map.put("seq", seq);
		service.d_urllist(map);
		service.d_rss(map);
		
		mav.setView(jsonView);
		return mav;
		
	}
	
	@RequestMapping(value = "/importchk",method = RequestMethod.POST)
	public ModelAndView delete_keyword_multi_POST(HttpSession session, @RequestParam(value="checkboxValues[]") List<String> checkboxValues) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", checkboxValues);
		ArrayList<HashMap<String , Object>> list = service.s_rss_import(map);
		Calendar cal1 = Calendar.getInstance();
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		SimpleDateFormat formatter2 = new SimpleDateFormat("E");
		 String formatedNow1 = formatter.format(date);
		 String formatedNow2 = formatter2.format(date);
		String txt = ""	;
		
				
		for (HashMap<String, Object> hashMap : list) {
			
			txt+= "<br><b><a href=\""+hashMap.get("url")+"\" target=\"_black\" style=\"color:black\">"+hashMap.get("title")+"</a></b><br>" + 
				  "<b><span style=\"color:black\">/ "+hashMap.get("media")+"</span></b><br>";
		}
				
		String txt2 = "<div align=\"center\">\n" + 
				"	<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"765\" style=\"width: 574.0pt; border-collapse: collapse; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 0cm 0cm 0cm\">\n" + 
				"		<tbody><tr><td valign=\"top\" style=\"border: inset #C5C5C5 1.0pt; padding: 0cm 0cm 0cm 0cm\">\n" + 
				"					\n" + 
				"					<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림;\">\n" + 
				"						<span lang=\"EN-US\" style=\"display: none; mso-hide: all\"></span>\n" + 
				"					</p>\n" + 
				"					<p></p>\n" + 
				"					<div align=\"center\">\n" + 
				"						<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; border: none; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: none; mso-border-insidev: none\">\n" + 
				"							<tbody><tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 1.0cm\"><td width=\"763\" style=\"width: 572.25pt; background: #F60000; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm\">\n" + 
				"										<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림; text-align: justify; text-justify: inter-ideograph\">\n" + 
				"											<b><span style=\"font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast; color: white; mso-themecolor: background1\">업종<span lang=\"EN-US\"></span></span></b>\n" + 
				"										</p>\n" + 
				"										<p></p>\n" + 
				"									</td></tr><tr><td valign=\"top\" width=\"763\" style=\"width: 572.25pt; padding: 0cm 5.4pt 0cm 5.4pt\">\n" + 
				"										<p style=\"mso-style-priority: 1; mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림;\"><br></p>\n" + 
				"									</td></tr><tr style=\"mso-yfti-irow: 2; height: 1.0cm\"><td width=\"763\" style=\"width: 572.25pt; background: #F60000; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm\">\n" + 
				"										<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림; text-align: justify; text-justify: inter-ideograph\">\n" + 
				"											<b><span style=\"font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast; color: white; mso-themecolor: background1\">타깃고객</span></b><b><span lang=\"EN-US\" style=\"font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast\"></span></b>\n" + 
				"										</p>\n" + 
				"										<p></p>\n" + 
				"									</td></tr><tr><td valign=\"top\" width=\"763\" style=\"width: 572.25pt; padding: 0cm 5.4pt 0cm 5.4pt\">\n" + 
				"										<p style=\"mso-style-priority: 1; mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림;\"><br></p>\n" + 
				"									</td></tr><tr style=\"mso-yfti-irow: 4; height: 1.0cm\"><td width=\"763\" style=\"width: 572.25pt; background: #F60000; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm\">\n" + 
				"										<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림; text-align: justify; text-justify: inter-ideograph\">\n" + 
				"											<b><span style=\"font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast; color: white; mso-themecolor: background1\">경쟁사</span></b><b><span lang=\"EN-US\" style=\"font-size: 10.0pt; font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast\"></span></b>\n" + 
				"										</p>\n" + 
				"										<p></p>\n" + 
				"									</td></tr><tr><td valign=\"top\" width=\"763\" style=\"width: 572.25pt; padding: 0cm 5.4pt 0cm 5.4pt\">\n" + 
				"										<p style=\"mso-style-priority: 1; mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림;\"><br></p>\n" + 
				"									</td></tr><tr style=\"mso-yfti-irow: 6; height: 31.7pt\"><td width=\"763\" style=\"width: 572.25pt; background: red; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.7pt\">\n" + 
				"										<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림; text-align: justify; text-justify: inter-ideograph\">\n" + 
				"											<b><span style=\"font-family: '맑은 고딕'; mso-ascii-theme-font: major-fareast; mso-fareast-theme-font: major-fareast; mso-hansi-theme-font: major-fareast; color: white; mso-themecolor: background1\">업계</span><span lang=\"EN-US\"></span></b>\n" + 
				"										</p>\n" + 
				"										<p></p>\n" + 
				"									</td></tr><tr><td valign=\"top\" width=\"763\" style=\"width: 572.25pt; padding: 0cm 5.4pt 0cm 5.4pt\">\n" + 
				"										<p style=\"mso-style-priority: 1; mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림;\"><br></p>\n" + 
				"									</td></tr></tbody>\n" + 
				"						</table>\n" + 
				"					</div>\n" + 
				"					<p style=\"mso-style-unhide: no; mso-style-qformat: yes; mso-style-parent: ''; margin: 0cm; mso-pagination: widow-orphan; font-size: 12.0pt; font-family: 굴림; mso-bidi-font-family: 굴림; margin-left: 36.0pt; mso-line-height-alt: 11.25pt; vertical-align: top; word-break: break-hangul\">\n" + 
				"						<span lang=\"EN-US\"></span>\n" + 
				"					</p>\n" + 
				"					<p></p>\n" + 
				"					<p></p>\n" + 
				"				</td></tr></tbody>\n" + 
				"	</table>\n" + 
				"\n" + 
				"</div>\n" + 
				"<p align=\"right\" style=\"text-align: right\">\n" + 
				"	<span lang=\"EN-US\" style=\"font-size: 10.0pt\">&nbsp;</span>\n" + 
				"</p>\n" + 
				"<p>\n" + 
				"	<span lang=\"EN-US\" style=\"font-size: 10.0pt\">&nbsp;</span>\n" + 
				"</p>\n" + 
				"<p align=\"right\" style=\"text-align: right\">\n" + 
				"	<span lang=\"EN-US\" style=\"font-size: 10.0pt\">[</span><span style=\"font-size: 10.0pt\"><span lang=\"EN-US\">] Daily\n" + 
				"			Media Monitoring _ "+formatedNow1+"</span><span lang=\"EN-US\"> (</span>"+formatedNow2+"<span lang=\"EN-US\">)</span></span>\n <br>-이상" + 
				"</p>\n" ;
			
			
		txt+= txt2;	
		
		mav.addObject("import", txt);
		mav.setView(jsonView);
		return mav;
	}
	
	
	@RequestMapping(value = "receiveapi", method = RequestMethod.POST)
	@ResponseBody
	public String receiveapi(@RequestBody String naver,ServletRequest request) throws UnsupportedEncodingException {
		String decodeResult = URLDecoder.decode(naver, "UTF-8");
		char last = decodeResult.charAt(decodeResult.length() - 1);
		if(last == '='){
			decodeResult = decodeResult.substring(0,decodeResult.length()-1);
			
		}
        try {
            Object o =  new JSONParser().parse(decodeResult);
            HashMap<String, Object> map = new HashMap<String, Object>();
            ArrayList<HashMap<String, Object>> list =(ArrayList<HashMap<String,Object>>) o;
//            service.insert(list.get(0));
        	if(list.get(0).get("type").toString().contains("0")) {
        		map.put("rss_name", list.get(0).get("rss_name"));
        		map.put("iconimg",list.get(0).get("iconimg"));
        		map.put("seq", list.get(0).get("list_seq"));
        		map.put("flag", 1);
        		service.u_urllist(map);
        		
        		
        		
        	}else {
        		HashMap<String, Object> map1 = new HashMap<>();
        		map1.put("seq", list.get(0).get("list_seq").toString());
        		map1.put("url", list.get(0).get("url").toString());
        		if(service.s_rssexists(map1) != 1) {
        			Calendar cal1 = Calendar.getInstance();
            		
            		
    	    		if(list.get(0).get("date").toString().contains("일 전")) {
    	    			cal1.add(Calendar.DATE, -1*Integer.parseInt(list.get(0).get("date").toString().replace("일 전", "")));
    	    			Date date = new Date(cal1.getTimeInMillis());
    	        	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	        	    String formatedNow1 = formatter.format(date);
    	        	    list.get(0).put("date", formatedNow1);

    	    		}else if(list.get(0).get("date").toString().contains("시간 전")) {
    	    			cal1.add(Calendar.HOUR, -1*Integer.parseInt(list.get(0).get("date").toString().replace("시간 전", "")));
    	    			Date date = new Date(cal1.getTimeInMillis());
    	        	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	        	    String formatedNow1 = formatter.format(date);
    	        	    list.get(0).put("date", formatedNow1);
    	    		}else if(list.get(0).get("date").toString().contains("분 전")) {
    	    			cal1.add(Calendar.MINUTE, -1*Integer.parseInt(list.get(0).get("date").toString().replace("분 전", "")));
    	    			Date date = new Date(cal1.getTimeInMillis());
    	        	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	        	    String formatedNow1 = formatter.format(date);
    	        	    list.get(0).put("date", formatedNow1);
    	    		}else if(list.get(0).get("date").toString().contains("초 전")) {
    	    			cal1.add(Calendar.SECOND, -1*Integer.parseInt(list.get(0).get("date").toString().replace("초 전", "")));
    	    			Date date = new Date(cal1.getTimeInMillis());
    	        	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	        	    String formatedNow1 = formatter.format(date);
    	        	    list.get(0).put("date", formatedNow1);
    	    		}else {
    	    			
    	    			list.get(0).put("date", list.get(0).get("date").toString().substring(0, list.get(0).get("date").toString().length() - 1));
    	    		}
    	    		
    	            service.i_rss(list.get(0));
        		}
        	}
        	
           
	
        }catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "dfasdf";
     
	}
	
	
	
}
