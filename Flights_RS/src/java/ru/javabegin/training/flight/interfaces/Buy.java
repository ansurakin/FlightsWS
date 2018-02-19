package ru.javabegin.training.flight.interfaces;

import ru.javabegin.training.flight.objects.Passenger;


public interface Buy {
    
    boolean buyTicket(Long flightId, Long placeId, Passenger passenger, String addInfo);

}
