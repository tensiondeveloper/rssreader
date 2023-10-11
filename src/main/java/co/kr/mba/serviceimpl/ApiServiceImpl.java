package co.kr.mba.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.mba.dao.Apidao;
import co.kr.mba.service.Apiservice;
import co.kr.mba.vo.userVO;

@Service
@Transactional
public class ApiServiceImpl implements Apiservice{


	@Autowired
	Apidao dao;

	@Override
	public ArrayList<HashMap<String, Object>> s_urllist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_urllist(map);
	}

	@Override
	public void i_urllist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.i_urllist(map);
	}

	@Override
	public void u_urllist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_urllist(map);
	}

	@Override
	public void i_rss(HashMap<String, Object> map) {
		// 프로그램에서 받아오는 뉴스데이터 한개씩 넣어야함 
		// * 길이가 상관이없나 확인 , for를 돌려서 얼마나 오래걸릴지도 확인 !
		dao.i_rss(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_urllist_send(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_urllist_send(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_rss_one(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_one(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_rss_all(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_all(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_rss_one_old(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_one_old(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_rss_all_old(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_all_old(map);
	}

	@Override
	public HashMap<String, Object> s_urllist_one(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_urllist_one(map);
	}

	@Override
	public void du_rss(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.du_rss(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_rss_import(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_import(map);
	}

	@Override
	public void d_urllist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_urllist(map);
	}

	@Override
	public void d_rss(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_rss(map);
	}

	@Override
	public int s_rssexists(HashMap<String, Object> map){
		// TODO Auto-generated method stub
		return dao.s_rssexists(map);
	}

	@Override
	public void u_urllist_flagall(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_urllist_flagall(map);
	}

	@Override
	public void u_urllist_flag(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_urllist_flag(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_filter(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_filter(map);
	}

	@Override
	public void i_filter(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.i_filter(map);
	}

	@Override
	public void d_filter(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_filter(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_cate1(map);
	}

	@Override
	public void i_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.i_cate1(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_cate2(String seq) {
		// TODO Auto-generated method stub
		return dao.s_cate2(seq);
	}

	@Override
	public void i_cate2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.i_cate2(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_cate3(String seq) {
		// TODO Auto-generated method stub
		return dao.s_cate3(seq);
	}

	@Override
	public HashMap<String, Object> s_catesideractive(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_catesideractive(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_urllistnull(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_urllistnull(map);
	}

	@Override
	public void u_rsslist_addcate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_rsslist_addcate(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_test() {
		// TODO Auto-generated method stub
		return dao.s_test();
	}

	@Override
	public void u_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_cate1(map);
	}

	@Override
	public void d_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_cate1(map);
	}

	@Override
	public void u_cate2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_cate2(map);
	}

	@Override
	public void d_cate2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_cate2(map);
	}

	@Override
	public void u_urllist_cate2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_urllist_cate2(map);
	}

	@Override
	public void d_cate2_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.d_cate2_cate1(map);
	}

	@Override
	public void u_urllist_cate1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_urllist_cate1(map);
	}

	@Override
	public HashMap<String, Object> select_user_all(String id) {
		// TODO Auto-generated method stub
		return dao.select_user_all(id);
	}

	@Override
	public int s_rss_one_old_cnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_one_old_cnt(map);
	}

	@Override
	public int s_rss_one_oldsum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_rss_one_oldsum(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> test_query(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.test_query(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_t1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_t1(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_t2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_t2(map);
	}

	@Override
	public ArrayList<HashMap<String, Object>> s_t3(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_t3(map);
	}

	@Override
	public HashMap<String, Object> select_user_protec(String id) {
		// TODO Auto-generated method stub
		return dao.select_user_protec(id);
	}

	@Override
	public void u_mypage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.u_mypage(map);
	}

	@Override
	public int s_join_match(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.s_join_match(map);
	}
	
	@Override
	public void i_join(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.i_join(map);
	}

	
	
	
	
}
