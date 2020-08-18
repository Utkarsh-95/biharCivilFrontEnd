package com.bfsc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
		.csrf()
//		.disable()
		.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
		.requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/"))
		.and()
			.authorizeRequests()
			//this match the rest api request from client that has /api/ in it
			//and that client's authentication has role of 'user' then only request can be forwarded
//			.antMatchers("/api/**").hasRole(UserRoles.USER.name())
			//in the same way we can create apis that are only consumable to the client 
			//that has some specific role assigned to them via their authentication
			
			
			//permission based security
			//will see on AdminUsername(READ/WRITE-permission) and AdminTraineeUsername(READ-permission)
//			.antMatchers(HttpMethod.POST, "/admin/api/**").hasAuthority(UserPermissions.ADMIN_WRITE.getPermission())
//			.antMatchers(HttpMethod.DELETE, "/admin/api/**").hasAuthority(UserPermissions.ADMIN_WRITE.getPermission())
//			.antMatchers(HttpMethod.PUT, "/admin/api/**").hasAuthority(UserPermissions.ADMIN_WRITE.getPermission())
//			.antMatchers("/admin/**").hasAnyRole(user.getRole() == "ADMIN" ? "ROLE_ADMIN" : "")
			.antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
			
			.antMatchers("/login")
			.permitAll()
			.anyRequest().authenticated()
		.and()
			.formLogin()
				.usernameParameter("username")
				.passwordParameter("password").loginPage("/login").permitAll()
		.and()
			.logout()
//			.logoutUrl("/logout")
			.logoutSuccessUrl("/login?logout").invalidateHttpSession(true).clearAuthentication(true)
//		.deleteCookies("1P_JAR","_xsrf")
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.and().exceptionHandling().accessDeniedPage("/error");
//		.and()
//			.sessionManagement()
//			.sessionFixation().migrateSession()
//        	.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
//        	.invalidSessionUrl("/login?invalid")
//        	.sessionAuthenticationErrorUrl("/login?invalid");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

}
