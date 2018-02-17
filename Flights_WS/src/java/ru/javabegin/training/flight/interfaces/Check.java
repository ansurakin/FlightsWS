package ru.javabegin.training.flight.interfaces;

import ru.javabegin.training.flight.objects.Reservation;



public interface Check {

    Reservation checkReservationByCode(String code);

//    Reservation checkReservationByDateReserv(String docNumber);
//
//    Reservation checkReservationByDateReserv(long date);
//
//    Reservation checkReservationByFamilyName(String familyName);

}
