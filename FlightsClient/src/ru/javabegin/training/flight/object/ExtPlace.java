package ru.javabegin.training.flight.object;

import ru.javabegin.training.flight.ws.Place;



public class ExtPlace extends Place{

    @Override
    public String toString() {
        return seatLetter+String.valueOf(seatNumber);
    }

    
    
}
