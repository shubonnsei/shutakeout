package com.shubonnsei.shutakeout;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootApplication
public class ShuTakeOutApplication {
	public static void main(String[] args) {
		SpringApplication.run(ShuTakeOutApplication.class, args);
		log.info("プロジェクトは正常に開始されました...");
	}
}
