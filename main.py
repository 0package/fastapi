from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
import requests

app = FastAPI()

@app.get("/")
def read_root():
	return {"message": "Hello CloudType, FastAPI on Raspberry Pi!"}

