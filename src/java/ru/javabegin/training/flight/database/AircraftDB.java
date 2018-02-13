package ru.javabegin.training.flight.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import ru.javabegin.training.flight.database.abstracts.AbstractObjectDB;
import ru.javabegin.training.flight.spr.objects.Aircraft;
import ru.javabegin.training.flight.spr.objects.Company;

public class AircraftDB extends AbstractObjectDB<Aircraft> {

    public final static String TABLE_SPR_AIRCRAFT = "spr_aircraft";

    private AircraftDB() {
        super(TABLE_SPR_AIRCRAFT);
    }
    private static AircraftDB instance;

    public static AircraftDB getInstance() {
        if (instance == null) {
            instance = new AircraftDB();
        }

        return instance;
    }

    @Override
    public Aircraft fillObject(ResultSet rs) throws SQLException {
        Aircraft aircraft = new Aircraft();
        aircraft.setId(rs.getLong("id"));
        aircraft.setDesc(rs.getString("desc"));
        aircraft.setName(rs.getString("name"));

//        ArrayList<Place> placeList = PlaceDB.getInstance().executeList(PlaceDB.getInstance().getStmtByAircraftID(rs.getLong("id")));
//        aircraft.setPlaceList(placeList);

        Company comp = CompanyDB.getInstance().executeObject(CompanyDB.getInstance().getObjectByID(rs.getInt("company_id")));

        aircraft.setCompany(comp);
        return aircraft;
    }
}
