package ru.javabegin.training.flight.rs.resources.objects;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import ru.javabegin.training.flight.objects.Flight;



@XmlRootElement(name = "flightList")
@XmlAccessorType(XmlAccessType.NONE)
public class FlightList {

    public FlightList() {
    }
    
    @XmlElement(name = "flightList")
    private List<Flight> list;

    
    public List<Flight> getList() {
        return list;
    }

    public void setList(List<Flight> list) {
        this.list = list;
    }


}