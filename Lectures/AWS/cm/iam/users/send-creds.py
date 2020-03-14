#!/usr/bin/env python3
import subprocess
import json
import os

out = subprocess.Popen(['terraform', 'output', '-json', 'user_info'],
                       stdout=subprocess.PIPE,
                       stderr=subprocess.STDOUT)
stdout, stderr = out.communicate()

str_output = stdout.decode("utf-8")
json_output = json.loads(str_output)
print(json_output)
for x in json_output:
    secret_token = os.popen(x['secret_key_command']).read()
    ui_password = os.popen(x['secret_password_command']).read()
    username = x['username']
    access_key_id = x['access_key_id']
    mail = f"Username:{username}\nPassword:{ui_password}\nAccess key id:{access_key_id}\nSecret token: {secret_token}"
    # os.system(f"echo '{mail}'| mail {username}")
    print(mail)
