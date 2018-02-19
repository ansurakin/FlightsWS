package ru.javabegin.training.flight.ws.interfaces;

import ru.javabegin.training.flight.enums.ListenerType;



public interface WSResultListener {
    void notify(Object object, ListenerType listenerType);
}
