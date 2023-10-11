package co.kr.mba.dao;

import java.util.ArrayList;
import java.util.HashMap;

import co.kr.mba.vo.userVO;

public interface Apidao {
	ArrayList<HashMap<String, Object>> test_query(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_t1(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_t2(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_t3(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_urllist(HashMap<String, Object> map);
	
	HashMap<String, Object> s_urllist_one(HashMap<String, Object> map);
	void i_urllist(HashMap<String, Object> map);
	void u_urllist(HashMap<String, Object> map);
	
	void i_rss(HashMap<String, Object> map );
	
	ArrayList<HashMap<String, Object>> s_urllist_send(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_rss_one(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_rss_all(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_rss_one_old(HashMap<String, Object> map);
	int s_rss_one_oldsum(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_rss_all_old(HashMap<String, Object> map);
	void du_rss (HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_rss_import(HashMap<String, Object> map);
	
	void d_urllist (HashMap<String, Object> map);
	void d_rss (HashMap<String, Object> map);
	
	int s_rssexists(HashMap<String, Object> map);
	
	void u_urllist_flagall(HashMap<String, Object> map);
	void u_urllist_flag(HashMap<String, Object> map);
	
	
	ArrayList<HashMap<String, Object>> s_filter(HashMap<String, Object> map);
	void i_filter(HashMap<String, Object> map);
	void d_filter(HashMap<String, Object> map);
	
	
	ArrayList<HashMap<String, Object>> s_cate1(HashMap<String, Object> map);
	void i_cate1(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_cate2(String seq);
	ArrayList<HashMap<String, Object>> s_cate3(String seq);
	void i_cate2(HashMap<String, Object> map);
	
	HashMap<String, Object> s_catesideractive(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> s_urllistnull(HashMap<String, Object> map);
	
	void u_rsslist_addcate(HashMap<String, Object> map);
	
	ArrayList<HashMap<String, Object>> s_test();
	void u_cate1(HashMap<String, Object> map);
	void d_cate1(HashMap<String, Object> map);
	void u_cate2(HashMap<String, Object> map);
	void d_cate2(HashMap<String, Object> map);
	void u_urllist_cate2(HashMap<String, Object> map);
	void d_cate2_cate1(HashMap<String, Object> map);
	void u_urllist_cate1(HashMap<String, Object> map);
	HashMap<String, Object> select_user_all(String id);
	HashMap<String, Object> select_user_protec(String id);
	int s_rss_one_old_cnt(HashMap<String, Object> map);
	
	void u_mypage(HashMap<String, Object> map);
	
	int s_join_match(HashMap<String, Object> map);
	void i_join(HashMap<String, Object> map);
}
