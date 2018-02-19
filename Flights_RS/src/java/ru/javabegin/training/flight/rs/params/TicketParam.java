package ru.javabegin.training.flight.rs.params;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import ru.javabegin.training.flight.objects.Passenger;

@XmlRootElement(name = "ticketParam")
@XmlAccessorType(XmlAccessType.FIELD)
public class TicketParam {

    private Long flightId;
    private Long placeId ;
    private Passenger passenger;
    private String addInfo;

    public Long getFlightId() {
        return flightId;
    }

    public void setFlightId(Long flightId) {
        this.flightId = flightId;
    }

    public Long getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Long placeId) {
        this.placeId = placeId;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo;
    }

   
    
}
