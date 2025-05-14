%dw 2.0
output application/java
---
{
    "queues": (payload filter ($.fifo == false and $."type" == "queue")).queueId default [],
    "exchanges": (payload filter ($."type" == "exchange")).exchangeId default [],
    "fifoQueues": (payload filter ($.fifo == true and $."type" == "queue")).queueId default []
}