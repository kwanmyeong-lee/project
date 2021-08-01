package com.it.lylj.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
public class ScheduleConfiguration {

	public static void main(String[] args) {
		SpringApplication.run(ScheduleConfiguration.class, args);
	}
}
