FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
RUN mkdir model_data
ADD model_data/ /app/model_data
COPY app.py /app
COPY make_prediction.sh /app
COPY Makefile /app
COPY requirements.txt /app
COPY run_docker.sh /app

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip3 install -r /app/requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
RUN chmod +x run_docker.sh
# CMD sh -c "run_docker.sh"
# RUN nohup run_docker.sh &>/dev/null &
CMD ["./run_docker.sh"]
