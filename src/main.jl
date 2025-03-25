using Kafka
using JSON3
using Logging

brokers = "kafka:9092"  # Docker service name (if using docker-compose)
topic = "test-topic"

consumer = Kafka.Consumer(brokers, "my-julia-group")
Kafka.subscribe(consumer, [topic])

@info "Kafka consumer started."

while true
    msg = Kafka.poll(consumer, 1000)
    if msg !== nothing
        parsed = JSON3.read(String(msg.value))
        @info "Received message: $(parsed)"
    end
end
