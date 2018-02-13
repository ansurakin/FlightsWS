package ru.javabegin.training.flight.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import ru.javabegin.training.flight.database.abstracts.AbstractObjectDB;
import ru.javabegin.training.flight.spr.objects.FlightClass;

public class FlightClassDB extends AbstractObjectDB<FlightClass> {

    public final static String TABLE_SPR_FLIGHT_CLASS = "spr_flight_class";

    private FlightClassDB() {
        super(TABLE_SPR_FLIGHT_CLASS);
    }
    private static FlightClassDB instance;

    public static FlightClassDB getInstance() {
        if (instance == null) {
            instance = new FlightClassDB();
        }

        return instance;
    }


    @Override
    public FlightClass fillObject(ResultSet rs) throws SQLException {
        FlightClass flightClass = new FlightClass();
        flightClass.setId(rs.getLong("id"));
        flightClass.setName(rs.getString("name"));
        flightClass.setDesc(rs.getString("desc"));
        return flightClass;
    }
    
    
}
