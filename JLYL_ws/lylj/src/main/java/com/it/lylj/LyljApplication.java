package com.it.lylj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class LyljApplication {

	public static void main(String[] args) {
		SpringApplication.run(LyljApplication.class, args);
	}

}
