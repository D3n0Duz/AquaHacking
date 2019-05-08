FROM python:3

ADD . /
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
WORKDIR /app

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]