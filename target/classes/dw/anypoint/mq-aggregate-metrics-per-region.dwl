%dw 2.0
output application/json 
var regionPayload = payload.payload
--- 
{ 
	region_id: vars.regionId, 
	queues: {
		commonQueues:{"size": sizeOf(vars.mqDestinations.queues),"Queue_Names": vars.mqDestinations.queues},
		fifoQueues: {"size": sizeOf(vars.mqDestinations.fifoQueues),"Queue_Names": vars.mqDestinations.fifoQueues}, 
		messagesInFlight: sum(regionPayload.messagesInFlight default [0]),
	    messagesSent: sum(regionPayload.messagesSent default [0]),
	    messagesReceived: sum(regionPayload.messagesReceived default [0]),
	    messagesAck: sum(regionPayload.messagesAck default [0])	
	},
	exchanges: {
		exchangeQueues: vars.mqDestinations.exchanges,
		messagesPublished: sum(regionPayload.messagesPublished default [0]),
		messagesDelivered: sum(regionPayload.messageDelivered default [0])
	}
}