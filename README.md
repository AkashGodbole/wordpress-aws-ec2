# wordpress-aws-ec2
Creating a Wordpress website on AWS using ansible

Requirements:
- Python3
- Ansible
- Boto3

- There should be .boto file inside the home directory of the currrent user. (For linux user using ansible with AWS)
- For reference. .boto file show have these fields:
```
aws_access_key_id=<key id>
aws_secret_access_key=<secret access key>
```

Future work:
CORS

Temporary workaround:
Using browser plugin "Moesif CORS"
