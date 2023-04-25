ARG VARIANT="3.10.10-bullseye"

FROM python:${VARIANT}

RUN apt-get update \
& apt-get upgrade -y

SHELL ["/bin/bash", "--login" , "-c"]
RUN pip install --upgrade pip
SHELL ["/bin/sh", "-c"]

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]