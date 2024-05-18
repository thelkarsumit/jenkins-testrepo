FROM python:3.7

# copy all files
RUN mkdir app
COPY . /app
WORKDIR /app

# install required libraries
RUN pip -r myapp/requirements.txt

EXPOSE 5000

CMD ["python", "main.py"]