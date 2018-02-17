package ro.health.client.handler;

import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPHeader;
import javax.xml.ws.handler.MessageContext.Scope;
import javax.xml.ws.handler.soap.SOAPMessageContext;

/**
 * SOAP handler that stores in the application context the relatesTo field. This
 * will help to determine the correspondence between requests and responses.
 * 
 * @author Victor Ichim
 * 
 */
public class CallbackHandler extends AddressingHandler {

	@Override
	public boolean handleMessage(SOAPMessageContext context) {
		Boolean isOutbound = (Boolean) context
				.get(SOAPMessageContext.MESSAGE_OUTBOUND_PROPERTY);
		if (!isOutbound) {
			try {
				SOAPEnvelope envelope = context.getMessage().getSOAPPart()
						.getEnvelope();
				SOAPHeader header = envelope.getHeader();

				/* store in application context the relatesTo field */
				context.put(AddressingHandler.RELATES_TO, getRelatesTo(header));
				context.setScope(AddressingHandler.RELATES_TO,
						Scope.APPLICATION);
			} catch (Exception ex) {
				throw new RuntimeException(ex);
			}
		}

		return true;
	}

}
