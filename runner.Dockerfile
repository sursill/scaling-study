FROM python:3.12-alpine

WORKDIR /usr/src/app

COPY ./requirements.txt ./run.py ./

RUN pip install -r requirements.txt

CMD [ "python", "run.py" ]
