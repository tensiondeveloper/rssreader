package co.kr.mba.scheduler;


import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.kr.mba.service.Apiservice;




/**
 * @author Developer
 * <pre>
 * kr.co.vcatch.scheduler
 * schedullerController.java
 * </pre>
 * @author   : Developer
 * @Date     : 2016. 6. 28.
 * @Version  :
 */
@Component
public class schedullerController {

	

	@Autowired
	Apiservice service;
	
		
/*	@Scheduled(cron="0 1 6 * * *")
	public void relation11() {
		HashMap<String, Object> map = new  HashMap<>();
		System.out.println("0 1 6 * * * 돌음 매일 6시1분에 돌음");
		service.u_urllist_flagall(map);
	}*/
	@Scheduled(cron="0 0 0/2 * * *")
	public void relation21() {
		HashMap<String, Object> map = new  HashMap<>();
		long startTime = System.currentTimeMillis(); 			
		System.out.println("0 */2 * * * * 돌음 두시간마다 돌음 TIME_ = " + new Timestamp(startTime));
		service.u_urllist_flagall(map);
	}
	
}
