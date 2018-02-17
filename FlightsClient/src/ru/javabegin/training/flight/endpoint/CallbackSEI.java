package ru.javabegin.training.flight.endpoint;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.annotation.Resource;
import javax.jws.HandlerChain;
import javax.jws.Oneway;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.soap.Addressing;
import ru.javabegin.training.flight.enums.ListenerType;
import ru.javabegin.training.flight.listeners.Registrator;
import ru.javabegin.training.flight.object.ExtCity;
import ru.javabegin.training.flight.ws.City;
import ru.javabegin.training.flight.ws.Flight;
import ru.javabegin.training.flight.ws.Reservation;
import ru.javabegin.training.flight.ws.interfaces.WSResultListener;


@WebService(targetNamespace = "http://javabegin.ru/training/ws")
@Addressing
@HandlerChain(file = "handler_chain.xml")
public class CallbackSEI {

    public static final String REPLY_TO_ADDRESS = "http://localhost:2014/flightCallback";
    @Resource
    private WebServiceContext context;


    
    @Oneway
    @WebMethod
    @Action(input = "http://javabegin.ru/training/ws/FlightWS/checkReservationByCodeResponse")
    @RequestWrapper(localName = "checkReservationByCodeResponse", targetNamespace = "http://javabegin.ru/training/ws", className = "ru.javabegin.training.flight.ws.CheckReservationByCodeResponse")
    public void checkReservationByCodeResponse(@WebParam(name = "return") Reservation reservation) {
        notifyListeners(reservation, ListenerType.CHECK_RESERVATION);
    }

    @Oneway
    @WebMethod
    @Action(input = "http://javabegin.ru/training/ws/FlightWS/getAllCitiesResponse")
    @RequestWrapper(localName = "getAllCitiesResponse", targetNamespace = "http://javabegin.ru/training/ws", className = "ru.javabegin.training.flight.ws.GetAllCitiesResponse")
    public void getAllCitiesResponse(@WebParam(name = "return") List<City> list) {
        ArrayList<ExtCity> cityList = new ArrayList<>();

        try {
            for (City city : list) {
                ExtCity extCity = new ExtCity();
                extCity.setCode(city.getCode());
                extCity.setCountry(city.getCountry());
                extCity.setDesc(city.getDesc());
                extCity.setId(city.getId());
                extCity.setName(city.getName());
                cityList.add(extCity);
            }

            Collections.sort(cityList, new Comparator<City>() {
                @Override
                public int compare(City t, City t1) {
                    return t.getName().compareTo(t1.getName());
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        notifyListeners(cityList, ListenerType.ADD_CITIES);
    }

    @Oneway
    @WebMethod
    @RequestWrapper(localName = "searchFlightResponse", targetNamespace = "http://javabegin.ru/training/ws", className = "ru.javabegin.training.flight.ws.SearchFlightResponse")
    @Action(input = "http://javabegin.ru/training/ws/FlightWS/searchFlightResponse")
    public void searchFlightResponse(@WebParam(name = "return") List<Flight> list) {
        notifyListeners(list, ListenerType.SEARCH_FLIGHT);
    }

    @Oneway
    @WebMethod
    @RequestWrapper(localName = "buyTicketResponse", targetNamespace = "http://javabegin.ru/training/ws", className = "ru.javabegin.training.flight.ws.BuyTicketResponse")
    @Action(input = "http://javabegin.ru/training/ws/FlightWS/buyTicketResponse")
    public void buyTicket(@WebParam(name = "return") boolean result){
        
        notifyListeners(result, ListenerType.BUY_TICKET);
    }
     

    private void notifyListeners(Object obj, ListenerType listenerType) {
        for (WSResultListener listener : Registrator.getInstance().getListeners(listenerType)) {
            listener.notify(obj, listenerType);
        }
    }
   
}
