package co.kr.mba.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import co.kr.mba.vo.userVO;

public class MemberService implements UserDetailsService{

	
	@Autowired
	Apiservice service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
	    HashMap<String, Object> map = service.select_user_all(username);

		if (map == null) {
				System.out.println("여긴가?");
		         throw new UsernameNotFoundException("No user found with username");

		}	 
		System.out.println("들어왓다구염");
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		System.out.println(map);
	     roles.add(new SimpleGrantedAuthority(map.get("security_code").toString()));	

	    UserDetails user = new User(username, map.get("password").toString(), roles);
	

           return  user;

	}

}



