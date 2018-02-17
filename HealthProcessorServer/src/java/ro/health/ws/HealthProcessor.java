package ro.health.ws;

import java.net.ProxySelector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.jws.HandlerChain;
import javax.jws.Oneway;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import javax.xml.ws.soap.Addressing;

import ro.health.ws.handler.AddressingHandler;

/**
 * A web service with addressing enabled. It prints addressing details for each
 * method.
 *
 * @author Victor Ichim
 *
 */
@WebService
@Addressing(required = true)
@HandlerChain(file = "handler_chain.xml")
public class HealthProcessor {

    public HealthProcessor() {
        ProxySelector.setDefault(new ro.health.client.CustomProxySelector());
    }
    
    
    @Resource
    private WebServiceContext context;

//    public String prescribeTraditional(String symptoms) {
//        printAddressingDetails();
//        return "pills";
//    }

    @WebMethod
    public String prescribeAlternative(String symptoms) {
        printAddressingDetails();
        return "tea";
    }

    private void printAddressingDetails() {
        MessageContext messageContext = context.getMessageContext();
        System.out.println("Received message ID: " + messageContext.get(AddressingHandler.MESSAGE_ID));
        System.out.println("Reply To address: " + messageContext.get(AddressingHandler.REPLY_TO));
    }
}
