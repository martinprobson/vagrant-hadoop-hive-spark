package net.martinprobson.example.spring.config;

import com.example.helloservicestarter.HelloService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class ConfigApplication {

  public static void main(String[] args) {
    SpringApplication.run(ConfigApplication.class, args).close();
  }

  @Bean
  public CommandLineRunner run(HelloService helloService) {
   return (args -> System.out.println(helloService.sayHello()));
  }
}
