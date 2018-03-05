package com.example.endpoints.com.example.model;

import java.util.Map;

/**
 * // Modded class for echo msg
 */
public class ModdedEcho {

  private String requestUrl;

  private Map echoMsg;

  public ModdedEcho(String requestUrl, Map echoMsg) {
    this.requestUrl = requestUrl;
    this.echoMsg = echoMsg;
  }

  public String getRequestUrl() {
    return requestUrl;
  }

  public Map getEchoMsg() {
    return echoMsg;
  }
}
