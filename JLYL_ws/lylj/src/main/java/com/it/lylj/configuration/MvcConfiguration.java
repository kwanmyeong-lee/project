package com.it.lylj.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it.lylj.controller.LoginInterceptor;
import com.it.lylj.controller.LoginToLoginInterceptor;


@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
//		registry.addInterceptor(new LoginInterceptor())
//		.addPathPatterns("/shop/cart/*", "/shop/order/*","/member/memberEdit","/member/memberOut");
//		
		/* 로그인 안하고 접근하는 경우*/
		registry.addInterceptor(new LoginInterceptor())
		.excludePathPatterns("/login/login","/login/findPwd")
		.addPathPatterns("/*/*");
		
		/* 로그인상태에서 접근하는 경우*/
		registry.addInterceptor(new LoginToLoginInterceptor())
		.addPathPatterns("/");
		
		
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(50 * 1024 * 1024); // 파일당 업로드 크기 제한 (50MB)
		return multipartResolver;
	}
	
}
