# GCP Golang Calculator Image

## Follow this instructions to build an GCP image in Compute Engine using Packer and Ansible

1. First you need to download your account.json file and move it to the "/compute-engine" folder
2. In the folder, run the command ```packer build -var 'project_id={your_project_id}' -var 'service_account_json={your_account_json_name}' -var 'ssh_username={your_gcp_ssh_username}' packerGcp.json``` 
