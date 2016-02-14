curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
#Project: skilled-adapter-452
gcloud config set project skilled-adapter-452
#Make sure you authenticate using oauth2 and a browser:
gcloud auth login
#Information command: gcloud compute project-info describe
gcloud compute project-info add-metadata     --metadata  google-compute-default-region=us-east1,google-compute-default-zone=us-east1-b
gcloud config set compute/zone us-east1-b
gcloud config set compute/region us-east1
gcloud compute project-info add-metadata --metadata-from-file sshKeys=~/.ssh/XXXX

