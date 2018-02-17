package ro.health.client;

import java.net.ProxySelector;
import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.BindingProvider;
import javax.xml.ws.Endpoint;
import javax.xml.ws.handler.Handler;
import javax.xml.ws.soap.AddressingFeature;

import ro.health.client.handler.AddressingHandler;
import ro.health.client.handler.ClientHandler;
import ro.health.generated.HealthProcessor;
import ro.health.generated.HealthProcessorService;

/**
 * Demonstrates the use of WS-Addressing for asynchronous web services.
 *
 * @author Victor Ichim
 *
 */
public class HealthProcessorClient {

    private static final String SERVER_ADDRESS = "http://localhost:8080/HealthProcessorServer/HealthProcessorService";
    private static final String REPLY_TO_ADDRESS = "http://localhost:8081/HealtProcessorCallback";
    private HealthProcessor proxy;

    public HealthProcessorClient() {
        HealthProcessorService service = new HealthProcessorService();
        // create the proxy with addressing enabled
        proxy = service.getHealthProcessorPort(new AddressingFeature());

        // explicitly specify the server address
        // this is useful when you want to intercept the request
        BindingProvider provider = (BindingProvider) proxy;
        provider.getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, SERVER_ADDRESS);
    }

    public static void main(String[] args) throws Exception {

        ProxySelector.setDefault(new CustomProxySelector());

        HealthProcessorClient client = new HealthProcessorClient();

//        System.out.println("--> Synchronous WS-Addressing");
//        client.testAnonymousReply();

        System.out.println("--> Asynchronous WS-Addressing");
        client.testNonAnonymousReply();
    }

    /**
     * The ReplyTo address is not specified. This is equivalent to a synchronous
     * scenario where the response is immediately available.
     */
    public void testAnonymousReply() {
        System.out.println(proxy.prescribeTraditional("lazy"));
    }

    /**
     * The ReplyTo address is set to a different web service (callback)
     * maintained by the client.
     */
    public void testNonAnonymousReply() {
        System.out.println("Starting the callback endpoint...");
        Endpoint endpoint = Endpoint.publish(REPLY_TO_ADDRESS, new CallbackSEI());
   

        /* handler for setting the ReplyTo address */
        BindingProvider provider = (BindingProvider) proxy;
        List<Handler> handlerChain = new ArrayList<Handler>();
        handlerChain.add(new ClientHandler());
        provider.getBinding().setHandlerChain(handlerChain);

        // pass the replyTo address to the handler
        provider.getRequestContext().put(AddressingHandler.REPLY_TO, REPLY_TO_ADDRESS);

        // this request is equivalent to an one-way call
        // the response is expected in the callback service
        proxy.prescribeAlternative("lazy");

        System.out.println("Generated message ID in request: "
                + provider.getResponseContext().get(
                AddressingHandler.MESSAGE_ID));

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            throw new RuntimeException(ex);
        }

        System.out.println("Stopping the callback endpoint...");
        endpoint.stop();
    }
}
