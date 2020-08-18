//package com.bfsc.config;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.core.session.SessionInformation;
//import org.springframework.security.core.session.SessionRegistry;
//import org.springframework.security.core.session.SessionRegistryImpl;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.NoOpPasswordEncoder;
//import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
//import org.springframework.security.web.session.HttpSessionEventPublisher;
//import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
//
//@Configuration
//@EnableWebSecurity
//public class TestSecurityConfig extends WebSecurityConfigurerAdapter {
//
//	@Autowired
//	private UserDetailsService userDetailsService;
//
//	@Bean
//	public AuthenticationProvider authProvider() {
//		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
//		provider.setUserDetailsService(userDetailsService);
////		provider.setPasswordEncoder(new BCryptPasswordEncoder());
//		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
//		return provider;
//	}
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//
//		http
//		.csrf().requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/")).and()
////		.csrf().disable()
//		.authorizeRequests()
////		.antMatchers("**/").permitAll()
//		.anyRequest().authenticated()
//		.and()
//		.formLogin()
//		.usernameParameter("username")
//		.passwordParameter("irrelevant")
//		.loginPage("/login").permitAll()
//		.and()
//		.logout()
////		.clearAuthentication(true)
////		.deleteCookies("1P_JAR","username-localhost-8889","username-localhost-8888","username-localhost-8890","_xsrf")
//		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//		.logoutSuccessUrl("/login?logout").invalidateHttpSession(true).deleteCookies("JSESSIONID")
//		.and().exceptionHandling().accessDeniedPage("/error");
////		.and()
////		http.sessionManagement().maximumSessions(1).maxSessionsPreventsLogin(false);
////		http.sessionManagement().sessionFixation().migrateSession().sessionAuthenticationStrategy(registerSessionAuthStr());
////		.expiredUrl("/sessionExpired");
////		.invalidSessionUrl("/invalidSession");
////		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
////		.invalidSessionUrl("/login?invalid").sessionAuthenticationErrorUrl("/login?invalid");
//
//	}
//	
////	@Bean
////    public SessionRegistry sessionRegistry() {
////		SessionRegistry sessionRegistry = new SessionRegistryImpl();
////		return sessionRegistry;
////    }
////	
////	@Bean
////    public RegisterSessionAuthenticationStrategy registerSessionAuthStr() {
////		return new RegisterSessionAuthenticationStrategy(sessionRegistry());
////    }
////	
////	@Bean
////	public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() { //enabling the concurrent session-control support
////      return new ServletListenerRegistrationBean<HttpSessionEventPublisher>(new HttpSessionEventPublisher());
////	}
//	
////	@Bean
////    public HttpSessionEventPublisher httpSessionEventPublisher() { //enabling the concurrent session-control support
////        return new HttpSessionEventPublisher();
////    }
//
//	@Override
//	public void configure(WebSecurity web) throws Exception {
//		web.ignoring().antMatchers("/resources/**");
//	}
//
//}
