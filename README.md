
**Note WIP**

# Spring Boot - Under the Covers

## Summary
This repo shows three methods of spring boot configuration: -

### @Configuration Annotation 
Configure a class with the `@Configuration` annotation
and define a `@Bean` method that gets the service: -

```java
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration public class HelloServiceConfiguration {
  @Bean
  public HelloService getHelloService() {
    return new MyHelloService();
  }
```

## Configure the Class directly with a @Service Annotation

```java
import org.springframework.stereotype.Service;

@Service
class MyHelloService {
  //...
}
```

## Use Auto Configuration Factory


