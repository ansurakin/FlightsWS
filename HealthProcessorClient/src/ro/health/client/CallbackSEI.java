package ro.health.client;

import javax.annotation.Resource;
import javax.jws.HandlerChain;
import javax.jws.Oneway;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.soap.Addressing;

import ro.health.client.handler.AddressingHandler;

/**
 * Callback web service - SEI.
 * <p>
 * This should be used for more complex payloads; otherwise the dynamic provider
 * is a better alternative (you avoid all the mappings).
 * 
 * @author Victor Ichim
 * 
 */
@WebService
@Addressing
@HandlerChain(file = "handler_chain.xml")
public class CallbackSEI {

	@Resource
	private WebServiceContext context;

	@Oneway
	@Action(input = "http://ws.health.ro/HealthProcessor/prescribeAlternativeResponse")
	@RequestWrapper(localName = "prescribeAlternativeResponse", targetNamespace = "http://ws.health.ro/")
	public void handleNotification(@WebParam(name = "return") String recipe) {
		System.out.println("Asynch response received: " + recipe);
		System.out.println("This response relates to the message ID: " + context.getMessageContext().get(AddressingHandler.RELATES_TO));
	}

}
