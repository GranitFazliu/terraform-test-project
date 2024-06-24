# terraform-test-project

Note everything here is deployed via GitHub Actions and can be seen in the .github/workflows folder

1)  Dockerize (locally) simple web application (Feel free to find source in internet)
    + create dockerfile 
    + build docker image 
    + upload to docker registry

   For this test project i choose the Posts example application that Fask has inside its /examples/tutorial directory:
   https://github.com/pallets/flask/tree/main/examples/tutorial
   The Dockerfile is in this Repository:
   https://github.com/GranitFazliu/terraform-test-project/blob/983189a9d6a8c5e80ab0d22fa0881c826a9eeca5/docker/Dockerfile#L1-L30
  This image has been upload to my public repository on Docker hub: 
  Visit https://hub.docker.com/repository/docker/granitfazliudev/solab-app/general
  Running it locally looks like this:
 ![Alt text](images/simple-app-localy.PNG) 

2) Install and use terraform on free azure subscription to create a resource or service by choise.
      - Configure remote state (blob storage account).
3) Using Terraform, create and configure an AKS Cluster on Azure and deploy web application from the first task.

For point 2 and 3 we have the code in the repo that that parteins to terraform and when the application was deployed using GitHub Actions on AKS this is what it looks like ( exposed via loadbalancer type service with external IP ):
![Alt text](/images/simple-app-azure.PNG) 
The code is a bit messy when it comes to organization and deployment but it did the job :)

4)  Use by choice scripting language and do some file operations, like:
    Write text to file.
    Copy content of one file to another.
    Filter content of file by choice, (example. count dots, lines, or find words starting with 'xyz*').
    https://github.com/GranitFazliu/terraform-test-project/blob/983189a9d6a8c5e80ab0d22fa0881c826a9eeca5/scripts/bash-commands.sh#L1-L31

5)  Implement monitoring and logging for a web application using Prometheus and Grafana.
    This one is tricky as it used to worked but then i broke it and didn't have time to fix again so i removed most parts especialy the ones for CPU/MEM monitoring.
    Grafana and Prometheus are deployed on AKS, Grafana has Prometheus as a Source but unfortunantly Promethoes started having issues so i stopped there due to time
    ![Alt text](/images/prometheus-up-time-graph.PNG) 
    If i had fixed Promethues then it would not have been hard to make 1 dashboard with 1 query.

6) By choice, create a simple cronjob, deploy to AKS, ie: print current time.
   https://github.com/GranitFazliu/terraform-test-project/blob/983189a9d6a8c5e80ab0d22fa0881c826a9eeca5/kubernetes/time-cronjob.yaml#L1-L18
   ![Alt text](/images/cronjob-pod-logs-aks.PNG) 
   check workflows file for deployment
7) Use Azure Quota API to retrieve list of quota limits for subscription or scope. (python, bash or powershell)
I did start this with Python first but then ran into some issues and switched to CURL commands
https://github.com/GranitFazliu/terraform-test-project/blob/a3b73b272e8a75bdde01ac6eb038ac8ba655b868/.github/workflows/check-azure-qouta.yml#L1-L23
 ![Alt text](/images/fetch-quota-data.PNG) 

Overall nice little exercise i think i learned alot about Azure during this. And for only having worked a day and a half on it it's okeyish
