package com.bfsc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bfsc.model.Config;
import com.bfsc.model.User;
import com.bfsc.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository repo;

	@Autowired
	private UserDetailsService userDetailsService;

	@Bean
	public AuthenticationProvider authProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		// provider.setPasswordEncoder(new BCryptPasswordEncoder());
		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
		return provider;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = repo.findByUsername(username);
		if (user == null)
			throw new UsernameNotFoundException("User not found");

		Config.USERNAME = user.getLoginname();
		Config.ROLE = user.getRole();
		Config.LOGIN_ID = user.getId();

		return new UserPrincipal(user, userRole(user.getRole()).getUserGrantedAuthority());
	}

	public ApplicationUserRolesAndPermissionEnum userRole(String role) {

		switch (role) {

		case "ADMIN":
			return ApplicationUserRolesAndPermissionEnum.ADMIN;

		case "USER":
			return ApplicationUserRolesAndPermissionEnum.USER;

		}

		return null;

	}

}
