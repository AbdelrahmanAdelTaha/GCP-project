# GCP-project
Deploy a Python web application in a GKE private cluster using a private virtual machine in GCP
 ,Build infrastructure using Terraform 
 ,Connect docker to GCR (google container registery) and pull images from it.
 
 ### Build Infrastructure using Terrafrom 
 - terraform init 
 - terraform apply
 
 ### Connect to private vm
 - `gcloud compute ssh --zone "us-central1-a" "private-vm"  --tunnel-through-iap --project "abdelrahmanadel-project2"`
 - install docker 
 - install gcloud
 - install kubectl
 - connect to gcloud using `gcloud auth login`
 - install gke-gcloud-auth-plugin ` gcloud install gke-gcloud-auth-plugin`
 - Configure Docker with GCR (google container registery) `gcloud auth configure-docker`
 - Dockerize the python app `docker build -t gcr.io/abdelrahmanadel-project2/pyflask`
 - push image to gcr `docker push gcr.io/abdelrahmanadel-project2/pyflask`
 
 ### Connect to private GKE-cluster through private vm 
 - `gcloud container clusters get-credentials private-cluster --zone us-central1-c --project abdelrahmanadel-project2`
 
 ### Deploy python-app to GKE
 - kubectl apply -f python-app.yaml
 
 ## Connect using loadbalancer Public ip
 
