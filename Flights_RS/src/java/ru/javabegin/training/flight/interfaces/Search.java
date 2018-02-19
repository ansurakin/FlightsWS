package ru.javabegin.training.flight.interfaces;

import java.util.ArrayList;
import ru.javabegin.training.flight.objects.Flight;
import ru.javabegin.training.flight.spr.objects.City;

public interface Search {
    
    ArrayList<Flight> searchFlight(Long date, Long cityFromId, Long cityToId);  
    
    ArrayList<City> getAllCities();

}
