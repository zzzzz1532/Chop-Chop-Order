package com.ispan.eeit69;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class CcoProjApplication {

	public static void main(String[] args) {
		SpringApplication.run(CcoProjApplication.class, args);
	}

}
