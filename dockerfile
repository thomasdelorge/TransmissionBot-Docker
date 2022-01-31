FROM python:3.8-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git gcc musl-dev linux-headers

RUN git clone https://github.com/twilsonco/TransmissionBot

WORKDIR /TransmissionBot

COPY requirements.txt .

RUN pip install -r requirements.txt

CMD [ "python", "./bot.py" ]