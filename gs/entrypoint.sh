#!/bin/bash
set -e

if [ -z $GCLOUD_ACCOUNT ]; then
  echo 'GCLOUD_ACCOUNT is not set'
  exit 1
fi

if [ -z $MODEL_URL ]; then
  echo 'MODEL_URL is not set'
  exit 1
fi

MODEL_NAME="${@:-model}"
PORT="${@:-9000}"

# Auth with Google Cloud
mkdir -p /opt/gcloud && \
echo ${GCLOUD_ACCOUNT} > /opt/gcloud/auth.base64 && \
base64 -d /opt/gcloud/auth.base64 >> /opt/gcloud/auth.json && \
gcloud auth activate-service-account --key-file=/opt/gcloud/auth.json ${GCLOUD_ACCOUNT_EMAIL}
rm /opt/gcloud/auth.json

# Pull down the model from Google Storage
mkdir -p /model/1
mkdir -p /tmp/model
gsutil -m cp ${MODEL_URL} /tmp/model/
tar xvzf /tmp/model/$(basename ${MODEL_URL}) -C /model/1

# Start the model server
set -x
tensorflow_model_server \
  --port=${PORT} \
  --model_name=${MODEL_NAME} \
  --model_base_path=/model