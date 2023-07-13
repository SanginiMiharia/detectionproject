FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install --upgrade pip
RUN pip install opencv-python
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
CMD ["python3", "gad.py"]

