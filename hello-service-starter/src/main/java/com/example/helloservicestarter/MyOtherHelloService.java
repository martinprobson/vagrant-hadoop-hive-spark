package com.example.helloservicestarter;

public class MyOtherHelloService implements HelloService {
  @Override public String sayHello() {
    return "Hello from other service - Martin!";
  }
}
