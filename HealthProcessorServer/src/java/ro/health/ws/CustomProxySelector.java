package ro.health.client;

import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.*;

public class CustomProxySelector extends ProxySelector {

    @Override
    public List select(URI uri) 
    {
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("localhost", 8088));
        ArrayList list = new ArrayList();
        list.add(proxy);
        return list;
    }

    @Override
    public void connectFailed(URI uri, SocketAddress sa, IOException ioe) {
        System.err.println("Connection to " + uri + " failed.");
    }
}