FROM python:3.9

WORKDIR /app

# https://github.com/lukearran/TvTimeToTrakt
RUN git clone https://github.com/lukearran/TvTimeToTrakt.git .

RUN pip install --no-cache-dir -r requirements.txt

COPY config.json .

CMD ["python", "TimeToTrakt.py"]