package com.it.lylj.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.email.controller.EmailController;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class Scheduler {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private final AttendDayService attendDayService;
	
	@Scheduled(cron= "30 59 23 * * *")
	public void updateAttendDayOffHour(){
		attendDayService.updateAutoOffHour();
	}
}
