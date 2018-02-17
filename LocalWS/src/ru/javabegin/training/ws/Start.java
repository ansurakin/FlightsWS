package ru.javabegin.training.ws;

import javax.xml.ws.Endpoint;



public class Start {
    
    public static void main(String[] args) {
        Endpoint endpoint = Endpoint.create(new LocalWS());
        endpoint.publish("http://localhost:2015/LocalWS");
        
        
        
    }

}
