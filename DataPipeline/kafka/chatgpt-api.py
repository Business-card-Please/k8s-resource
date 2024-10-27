from kafka import KafkaConsumer, KafkaProducer
import openai

# Kafka 설정
consumer = KafkaConsumer('raw-data', bootstrap_servers=['localhost:9092'])
producer = KafkaProducer(bootstrap_servers=['localhost:9092'])

# OpenAI API 설정
openai.api_key = 'your-api-key'

def filter_data(data):
    response = openai.Completion.create(
        engine="text-davinci-002",
        prompt=f"필터링 기준: {필터링_기준}\n\n데이터: {data}\n\n필터링 결과:",
        max_tokens=50
    )
    return response.choices[0].text.strip()

for message in consumer:
    raw_data = message.value.decode('utf-8')
    filtered_data = filter_data(raw_data)
    producer.send('filtered-data', filtered_data.encode('utf-8'))