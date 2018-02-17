package ru.javabegin.training.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class LocalWS {

    @WebMethod
    public String getString(String name) {
        return "hello " + name;
    }
}
