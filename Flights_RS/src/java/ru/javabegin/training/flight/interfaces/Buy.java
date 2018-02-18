package ru.javabegin.training.flight.interfaces;

import ru.javabegin.training.flight.objects.Flight;
import ru.javabegin.training.flight.objects.Passenger;
import ru.javabegin.training.flight.spr.objects.Place;


public interface Buy {
    
    boolean buyTicket(Flight flight, Place place, Passenger passenger, String addInfo);

}
