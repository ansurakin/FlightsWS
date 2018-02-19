package ru.javabegin.training.flight.interfaces.impls;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.javabegin.training.flight.database.ReservationDB;
import ru.javabegin.training.flight.interfaces.Check;
import ru.javabegin.training.flight.objects.Reservation;



public class CheckImpl implements Check{

    private ReservationDB reservDB = ReservationDB.getInstance();

    @Override
    public Reservation checkReservationByCode(String code) {
        Reservation reserv = null;
        try {
            reserv = reservDB.executeObject(reservDB.getStmtByCode(code));
        } catch (SQLException ex) {
            Logger.getLogger(CheckImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return reserv;
    }
    
     
//    @Override
//    public Reservation checkReservationByDateReserv(long date) {
//        Reservation reserv = null;
//        try {
//            Calendar c = GMTCalendar.getInstance();
//            c.setTimeInMillis(date);
//            
//            reserv = reservDB.executeObject(reservDB.getStmtByDateReserv(c));
//        } catch (SQLException ex) {
//            Logger.getLogger(CheckImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return reserv;
//    }
//    
//    @Override
//    public Reservation checkReservationByDateReserv(String docNumber) {
//        Reservation reserv = null;
//        try {
//            reserv = reservDB.executeObject(reservDB.getStmtByDocumentNumber(docNumber));
//        } catch (SQLException ex) {
//            Logger.getLogger(CheckImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return reserv;
//    }
//    
//    
//    @Override
//      public Reservation checkReservationByFamilyName(String familyName) {
//        Reservation reserv = null;
//        try {
//            reserv = reservDB.executeObject(reservDB.getStmtByFamilyName(familyName));
//        } catch (SQLException ex) {
//            Logger.getLogger(CheckImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return reserv;
//    }

}
