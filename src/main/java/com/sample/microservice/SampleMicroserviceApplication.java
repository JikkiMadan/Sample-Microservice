package com.sample.microservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient // Optional to add
public class SampleMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(SampleMicroserviceApplication.class, args);
	}

}
