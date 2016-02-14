
# Very large machine
gcloud compute instances create $NAME \
    --machine-type n1-standard-32 \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --image centos-7-v20160126 \
    --image-project centos-cloud

# Client machine
gcloud compute instances create $NAME \
    --machine-type n1-standard-16 \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --image centos-7-v20160126 \
    --image-project centos-cloud

