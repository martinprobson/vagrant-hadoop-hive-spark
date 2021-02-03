package net.martinprobson.example.spring.config;

import com.example.helloservicestarter.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@SpringBootApplication
@ComponentScan("com.example.helloservicestarter")
@ComponentScan("net.martinprobson.example.spring.config")
public class ConfigApplication implements CommandLineRunner {

  private static final Log logger = LogFactory.getLog(ConfigApplication.class);
  private final MyConfig myConfig;

  @Autowired
  public ConfigApplication(HelloService helloService, MyConfig myConfig) {
    this.helloService = helloService;
    this.myConfig = myConfig;
  }

  public static void main(String[] args) {
    SpringApplication.run(ConfigApplication.class, args).close();
  }

  String val2 = "fred";
  final HelloService helloService;

  @Value("${val}")
  String myValue;

  @Value(value = "#{val2}")
  String myValue2;

  @Override public void run(String... args) throws Exception {
    logger.info("Hello from logger");
    System.out.println(helloService.sayHello());
    System.out.println("Enabled = " + myConfig.isEnabled());
    System.out.println("Roles = " + myConfig.getRoles());
    System.out.println("myValue = " + myValue);
    System.out.println("myValue = " + myValue2);

  }
}
