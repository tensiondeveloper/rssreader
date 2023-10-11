package co.kr.mba.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.mba.dao.Apidao;
import co.kr.mba.dao.Boarddao;
import co.kr.mba.service.Apiservice;
import co.kr.mba.service.Boardservice;
import co.kr.mba.vo.userVO;

@Service
@Transactional
public class BoardServiceImpl implements Boardservice{


	@Autowired
	Boarddao dao;

	
	
	
}
