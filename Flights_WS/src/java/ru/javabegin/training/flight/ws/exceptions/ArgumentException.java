package ru.javabegin.training.flight.ws.exceptions;

import javax.xml.ws.WebFault;

@WebFault
public class ArgumentException extends TraceException{
    
    public ArgumentException(String string) {
        super(string);
    }

    @Override
    public ExceptionInfo getExceptionInfo() {
        return super.getExceptionInfo(); 
    }
    
    

}
