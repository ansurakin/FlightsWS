package ru.javabegin.training.flight.rs.resources.objects;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import ru.javabegin.training.flight.objects.Reservation;

@XmlRootElement(name = "reservationResult")
@XmlAccessorType(XmlAccessType.NONE)
public class ReservationResult {

    @XmlElement(name = "reservation")
    private Reservation reservation;

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }
    
    
    
    
}
