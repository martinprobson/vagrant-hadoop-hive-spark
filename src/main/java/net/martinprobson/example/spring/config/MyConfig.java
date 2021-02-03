package net.martinprobson.example.spring.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("myconfig")
public class MyConfig {

  private Boolean enabled;
  private List<String> roles = new ArrayList<>(Collections.singleton("USER"));

  public Boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(Boolean value) {
    this.enabled = value;
  }

  public Collection<String> getRoles() {
    return roles;
  }

}
