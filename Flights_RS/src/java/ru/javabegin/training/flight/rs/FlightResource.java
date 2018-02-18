package ru.javabegin.training.flight.rs;

import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import ru.javabegin.training.flight.interfaces.impls.SearchImpl;
import ru.javabegin.training.flight.spr.objects.City;

@Path("flight")
public class FlightResource {

    private SearchImpl searchImpl = new SearchImpl();

    public FlightResource() {
    }

    @GET
    @Produces(MediaType.APPLICATION_XML)
    @Path("allcities")
    public ResponseList getAllCities() {
        List<City> cityList = searchImpl.getAllCities();
        
        ResponseList responseList = new ResponseList();
        
        responseList.setList(cityList);
        
        return responseList;
    }
}
