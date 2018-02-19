package ru.javabegin.training.flight.rs.resources.objects;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import ru.javabegin.training.flight.spr.objects.City;



@XmlRootElement(name = "cityList")
@XmlAccessorType(XmlAccessType.NONE)
public class CityList {

    public CityList() {
    }
    
    @XmlElement(name = "cityList")
    private List<City> list;

    
    public List<City> getList() {
        return list;
    }

    public void setList(List<City> list) {
        this.list = list;
    }


}