FROM python:3.7.4-alpine3.10

COPY requirements.txt app.py /app/
RUN apk add curl

WORKDIR /app

RUN pip install -r requirements.txt

RUN chown -R daemon:daemon /app/
RUN curl -w '\n' -s "https://www.getyourguide.com/-t62214/reviews.json?&count=50&page=[0-50]&rating=0&type=&sortBy=&direction=&remove=false" >> data.json

USER daemon

EXPOSE 4000

CMD ["python", "/app/app.py"]