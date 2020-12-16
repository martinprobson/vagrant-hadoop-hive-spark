package com.example.helloservicestarter;

public class MyHelloService implements HelloService {
  @Override public String sayHello() {
    return "Hello Martin!";
  }
}
