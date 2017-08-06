Deploy models to `tensorflow-serving` via a given storage backend.


# Getting started


## HTTP

Using the `http/Dockerfile` or the image at `snormore/tensorflow-serving-http`, you can specify the follow environment variables giving acess to the model to be deployed:

 - `MODEL_URL` - is the HTTP(S) URL location of your model.


## Google Storage

Using the `gs/Dockerfile` or the image at `snormore/tensorflow-serving-gs`, you can specify the follow environment variables giving acess to the model to be deployed:

 - `GCLOUD_ACCOUNT` - is a base64 encoded representation of the JSON service account keyfile that gives access to the bucket containing your model.
 - `MODEL_URL` - is the Google Storage URL location of your model.


## Amazon S3

 - Not yet implemented.