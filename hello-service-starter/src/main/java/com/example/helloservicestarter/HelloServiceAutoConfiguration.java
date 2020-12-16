package com.example.helloservicestarter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HelloServiceAutoConfiguration {

  @Bean
  public HelloService getHelloService() {
    return new MyOtherHelloService();
  }
}
