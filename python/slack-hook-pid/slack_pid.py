# Script to send a list of all running processes to a slack channel
# Need to configure your OAuth Access Token and your channel name

import os
import slack

client = slack.WebClient({insert here your OAuth Access Token})

aux           = os.popen('ps -o pid,comm -A')
message       = aux.read()

response = client.chat_postMessage(
    channel='#development',
    text=message)
assert response["ok"]
