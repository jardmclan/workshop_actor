FROM python:3.6

RUN pip install --no-cache-dir tapipy

ADD actor.py /actor.py

CMD ["python", "/actor.py"]

from python:3.7
RUN useradd tapis
ADD requirements.txt /home/tapis/requirements.txt
RUN pip install -r /home/tapis/requirements.txt
RUN pip install git+https://github.com/tapis-project/tapipy#egg=tapipy

ADD actor.py /home/tapis/actor.py
RUN chown -R tapis:tapis /home/tapis
RUN chmod -R a+rwx /home/tapis

USER tapis
WORKDIR /home/tapis

ENTRYPOINT ["python", "/home/tapis/actor.py"]