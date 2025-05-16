FROM rocker/plumber

RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev

COPY . /app
WORKDIR /app

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=8000)"]
