#!/usr/bin/env bash

: ${MODEL_NAME:=model}
: ${PORT:=9000}

# Start the model server
set -x
tensorflow_model_server \
  --port=${PORT} \
  --model_name=${MODEL_NAME} \
  --model_base_path=/model