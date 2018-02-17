package ru.javabegin.training.flight.client;

import javax.xml.ws.BindingProvider;
import javax.xml.ws.Endpoint;
import javax.xml.ws.soap.AddressingFeature;
import ru.javabegin.training.flight.endpoint.CallbackSEI;
import ru.javabegin.training.flight.ws.handlers.AddressingHandler;
import ru.javabegin.training.flight.ws.FlightWS;
import ru.javabegin.training.flight.ws.FlightWSService;

public class FlightWSClient {

    private static FlightWSClient flightClient;

    public static FlightWSClient getInstance() {
        if (flightClient == null) {
            flightClient = new FlightWSClient();
        }

        return flightClient;
    }
    private FlightWSService flightWSService;
    private FlightWS flightWS;
    private CallbackSEI callbackSEI = new CallbackSEI();

    private FlightWSClient() {
        flightWSService = new FlightWSService();
        flightWS = flightWSService.getFlightWSPort(new AddressingFeature());


        Endpoint endpoint = Endpoint.publish(CallbackSEI.REPLY_TO_ADDRESS, callbackSEI);


        /* handler for setting the ReplyTo address */
        BindingProvider provider = (BindingProvider) flightWS;      

        // pass the replyTo address to the handler
        provider.getRequestContext().put(AddressingHandler.REPLY_TO, CallbackSEI.REPLY_TO_ADDRESS);


    }

    public CallbackSEI getCallbackSEI() {
        return callbackSEI;
    }

    public FlightWS getFlightWS() {
        return flightWS;
    }
}
