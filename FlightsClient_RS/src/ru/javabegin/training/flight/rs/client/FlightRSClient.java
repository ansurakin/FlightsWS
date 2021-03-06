/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.javabegin.training.flight.rs.client;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.json.JSONConfiguration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.ws.rs.core.MediaType;
import ru.javabegin.training.flight.object.ExtCity;
import ru.javabegin.training.flight.rs.objects.City;
import ru.javabegin.training.flight.rs.objects.CityList;
import ru.javabegin.training.flight.rs.objects.Flight;
import ru.javabegin.training.flight.rs.objects.FlightList;
import ru.javabegin.training.flight.rs.objects.Passenger;
import ru.javabegin.training.flight.rs.objects.Reservation;
import ru.javabegin.training.flight.rs.objects.ReservationResult;
import ru.javabegin.training.flight.rs.objects.TicketParam;

/**
 * Jersey REST client generated for REST resource:FlightRS [flight]<br>
 * USAGE:
 * <pre>
 *        FlightRSClient client = new FlightRSClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Tim
 */
public class FlightRSClient {

    private WebResource webResource;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/Flights_RS/rest";
    private static FlightRSClient instance;

    public static FlightRSClient getInstance() {
        if (instance == null) {
            instance = new FlightRSClient();
        }

        return instance;
    }

    private FlightRSClient() {
        com.sun.jersey.api.client.config.ClientConfig config = new com.sun.jersey.api.client.config.DefaultClientConfig();
        config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
        client = Client.create(config);
        webResource = client.resource(BASE_URI).path("flight");
    }

    public List<ExtCity> getAllCities() throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path("allcities");
        CityList cityListWrapper = resource.accept(MediaType.APPLICATION_JSON).get(CityList.class);

        ArrayList<ExtCity> cityList = new ArrayList<>();
        try {
            for (City city : cityListWrapper.getCityList()) {
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

        return cityList;
    }

    public List<Flight> searchFlight(Long date, Long cityFromId, Long cityToId) throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path("searchFlight").path(date.toString()).path(cityFromId.toString()).path(cityToId.toString());

        FlightList flightListWrapper = resource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(FlightList.class);
        return flightListWrapper.getFlightList();
    }

    public boolean buyTicket(Long flightId, Long placeId, Passenger passenger, String addInfo) {
        WebResource resource = webResource;
        resource = resource.path("buyTicket");

        TicketParam ticketParam = new TicketParam();
        ticketParam.setFlightId(flightId);
        ticketParam.setPlaceId(placeId);
        ticketParam.setPassenger(passenger);
        ticketParam.setAddInfo(addInfo);

        boolean result = resource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Boolean.class, ticketParam);
        return result;
    }

    public Reservation checkReservationByCode(String code) {
        WebResource resource = webResource;
        resource = resource.path("checkReservation").path(code);
        ReservationResult reservationResult = resource.type(MediaType.APPLICATION_JSON).get(ReservationResult.class);
        return reservationResult.getReservation();
    }

    public void close() {
        client.destroy();
    }
}
