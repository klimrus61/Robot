#!/home/resume_project/venv/bin/python

import json
import uvicorn as uvicorn
from fastapi import FastAPI
from pydantic import BaseModel

import rospy
from std_msgs.msg import String


app = FastAPI()
pub = rospy.Publisher('chatter', String, queue_size=10)
rospy.init_node('talker', anonymous=True)

class LogItem(BaseModel):
    data: str

@app.post("/info")
async def process(req: LogItem):
    new_data = json.dumps({"log": req.data})
    pub.publish(new_data)

if __name__ == '__main__':
    uvicorn.run(app, host="0.0.0.0", port=8001)
