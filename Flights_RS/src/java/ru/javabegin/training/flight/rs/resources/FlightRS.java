package ru.javabegin.training.flight.rs.resources;

import java.net.ProxySelector;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import ru.javabegin.training.flight.interfaces.impls.BuyImpl;
import ru.javabegin.training.flight.interfaces.impls.CheckImpl;
import ru.javabegin.training.flight.interfaces.impls.SearchImpl;
import ru.javabegin.training.flight.objects.Flight;
import ru.javabegin.training.flight.rs.params.TicketParam;
import ru.javabegin.training.flight.rs.resources.objects.CityList;
import ru.javabegin.training.flight.rs.resources.objects.FlightList;
import ru.javabegin.training.flight.rs.resources.objects.ReservationResult;
import ru.javabegin.training.flight.spr.objects.City;
import ru.javabegin.training.flight.utils.GMTCalendar;
import ru.javabegin.training.flight.ws.proxy.CustomProxySelector;

@Path("flight")
@Produces(MediaType.APPLICATION_JSON)
public class FlightRS {

    private SearchImpl searchImpl = new SearchImpl();
    private BuyImpl buyImpl = new BuyImpl();
    private CheckImpl checkImpl = new CheckImpl();

    public FlightRS() {
        ProxySelector.setDefault(new CustomProxySelector());
    }

    @GET
    @Path("/allcities")
    public CityList getAllCities() {
        List<City> list = searchImpl.getAllCities();
        CityList cityList = new CityList();
        cityList.setList(list);
        return cityList;
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/searchFlight/{date}/{cityFromId}/{cityToId}")
    public FlightList searchFlight(@PathParam("date") Long date, @PathParam("cityFromId") Long cityFromId, @PathParam("cityToId") Long cityToId) {

        FlightList flightList = new FlightList();
        ArrayList<Flight> list = new ArrayList<>();
        Calendar c = GMTCalendar.getInstance();
        c.setTimeInMillis(date);

        list.addAll(searchImpl.searchFlight(date, cityFromId, cityToId));

        flightList.setList(list);

        return flightList;
    }

    @POST
    @Path("/buyTicket")
    @Consumes(MediaType.APPLICATION_JSON)
    public boolean buyTicket(TicketParam ticketParam) {

        boolean result = buyImpl.buyTicket(ticketParam.getFlightId(), ticketParam.getPlaceId(), ticketParam.getPassenger(), ticketParam.getAddInfo());

        return result;
    }

    @GET
    @Path("/checkReservation/{code}")
    public ReservationResult checkReservationByCode(@PathParam("code") String code) {
        ReservationResult reservationResult = new ReservationResult();
        reservationResult.setReservation(checkImpl.checkReservationByCode(code));
        return reservationResult;
    }
}
