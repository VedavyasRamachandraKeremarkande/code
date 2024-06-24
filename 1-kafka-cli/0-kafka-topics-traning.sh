# Replace "kafka-topics.sh"
# by "kafka-topics" or "kafka-topics.bat" based on your system # (or bin/kafka-topics.sh or bin\windows\kafka-topics.bat if you didn't setup PATH / Environment variables)


############################
### CONDUKTOR PLATFORM #####
############################

# Create your playground.config file
# with content such as

# security.protocol=SASL_SSL
# sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="<your username>" password="<your password>";
# sasl.mechanism=PLAIN

bootstrap.servers=ample-honeybee-9472-us1-kafka.upstash.io:9092
sasl.mechanism=SCRAM-SHA-256
security.protocol=SASL_SSL
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
  username="YW1wbGUtaG9uZXliZWUtOTQ3MiREDPh4NoR31LBn87yGEOFH993Lm78nGQ3s3Nw" \
  password="OWYwNmQ0NTktZGQxMC00M2NlLTkwMGMtYTM1MGM0NjkzYjU1";

# Start running commands
kafka-topics.sh

kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092

kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --create --topic first_topic

kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --create --topic second_topic --partitions 5

# this will create a topic with an RF of 3 (behaviour of using Conduktor Platform - all topics have the same RF of 3)
kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --create --topic third_topic --replication-factor 2

# list topics
kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --list

# describe topics
kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --topic first_topic --describe

# delete topics
kafka-topics.sh --command-config kafkaCodes/playground.config --bootstrap-server ample-honeybee-9472-us1-kafka.upstash.io:9092 --topic second_topic --delete



############################
#####     LOCALHOST    #####
############################

kafka-topics.sh

kafka-topics.sh --bootstrap-server localhost:9092 --list

kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --create

kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

kafka-topics.sh --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 2

# Create a topic (working)
kafka-topics.sh --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 1

# List topics
kafka-topics.sh --bootstrap-server localhost:9092 --list

# Describe a topic
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --describe

# Delete a topic
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --delete
# (only works if delete.topic.enable=true)
