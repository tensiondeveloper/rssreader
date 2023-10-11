package co.kr.mba.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.mba.dao.Apidao;
import co.kr.mba.dao.Etcdao;
import co.kr.mba.service.Apiservice;
import co.kr.mba.service.Etcservice;
import co.kr.mba.vo.userVO;

@Service
@Transactional
public class EtcServiceImpl implements Etcservice{


	@Autowired
	Etcdao dao;

	
}
