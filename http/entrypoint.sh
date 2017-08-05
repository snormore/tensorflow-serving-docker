#!/bin/bash
set -e

if [ -z $MODEL_URL ]; then
  echo 'MODEL_URL is not set'
  exit 1
fi

if [ -z $MODEL_NAME ] || [ -z $MODEL_VERSION ]; then
  echo 'MODEL_NAME or MODEL_VERSION is not set'
  exit 1
fi

PORT="${@:-9000}"

# Pull down the model from Google Storage
mkdir -p /model/1
cd /tmp
curl -O ${MODEL_URL}
tar xvzf $(basename ${MODEL_URL}) -C /model/1

# Start the model server
set -x
tensorflow_model_server \
  --port=${PORT} \
  --model_name=${MODEL_NAME}-${MODEL_VERSION} \
  --model_base_path=/model