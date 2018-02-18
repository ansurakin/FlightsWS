/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rsclientproject;

import ru.javabegin.training.flight.rs.City;
import ru.javabegin.training.flight.rs.FlightRS;
import ru.javabegin.training.flight.rs.ResponseList;

/**
 *
 * @author Tim
 */
public class RSClientProject {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        FlightRS client = new FlightRS();
        ResponseList responseList = client.getAllCities(ResponseList.class);
        
        for (City city : responseList.getCity()) {
            System.out.println(city.getName());
        }
    }
}
