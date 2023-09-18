package com.shubonnsei.shutakeout.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {

	/*
	 * 静的リソース マッピングを設定するには、次を使用します。
	 */
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		log.info("静的リソース マッピングを開始します...");
		registry.addResourceHandler("/backend/**").addResourceLocations("classpath:/backend/");
		registry.addResourceHandler("/front/**").addResourceLocations("classpath:/front/");
	}
}