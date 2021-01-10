# MediaWiki Installation Using BlueGreen Deployment & Rolling Update
Lab Exercise

## Problem Statement
We want to automate the deployment of MediaWiki using.
* CFT with Any Configuration Management Tool (Only for AWS). If any 
--
Choose only one of your comfort.
* The above automation should support CI/CD practices of chosen deployment style like Rolling Update or BlueGreen Deployment. (Optional)

## Technologies Used
This Technologies used in this deployment is
* Yaml Scripting
* Python
* Shell Scripting
* Cloud Formation Template
* Ansible Playbooks

## Deployment Templates Available
* Blue-Green Deployment
* Rolling Update Template

## Deployment Steps

### File Details
* blueGreen.yaml                 - Cloud Formation template for blue green deployment.
* rollingUpdate.yaml             - Cloud Formation template for rolling deployment.
* parameters.json                - The parameters file for blue green deployment.
* mediawikiInstallationSteps.txt - Manual steps for mediawiki installation.
* dynamicInventory.py            - To create dynamic Inventory based on the ec2 tags.
* playbook.yaml                  - Ansible playbook for mediaWiki installation.
* seup.sh                        - Setup file for deployment.

### Deployment Process

#### Running in a single Step
* To complete the deployment in a single step
```
sh setup.sh
```

#### Running Each File Seperately
* To Deploy the Cloud Formation Stack using cli
```
echo "Creating the stack"
aws cloudformation create-stack --stack-name demo-stack --template-body blueGreen.yaml --parameters parameters.json
```

* To Create the inventory file dynamically
```
echo "Dynamically create the invertory file for ansible"
python3 dynamicInventory.py demo-stack us-east-1
```

* To install mediaWiki using ansible.
```
echo "Run Ansible Playbook to deploy mediaWiki"
ansible-playbook playbook.yaml -i invertory.txt
```

## Outputs
### cloud Formation Deployment
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/cf_output1.png" alt="cf_output">
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/cf_output2.png" alt="cf_output">

### Dynamic Inventory File
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/dynamic_inventory.png" alt="dynamic_inventory">

### Ansible Output
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/ansible1.png" alt="ansible1">
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/ansible2.png" alt="ansible2">

## MediaWiki Installation
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/output%20from%20lb.png" alt="mediaWiki">

## Architecture
### Blue Green Mode
<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/blue-green.png" alt="blue-green">

### Rolling Update Mode

<img src="https://github.com/sumanth979/ThoughtWorksLab/blob/main/outputs/rolling.png" alt="rolling">


## Other Possible Solutions
* We can use userdata to install the mediaWiki but the creation of userdata becomes more complex and there will be more chances to fail in b/w the run as it contains many steps.


---------------------------------------------------------------------------------------------------------------------------------------------------

- Due to time contraint the deployment is script is written as possible as i can. With more time we can enhance the script and modularize it.

## Other Blue Green deployments
### Blue Green Deployment using ECS
* https://github.com/sumanth979/AWS_BlueGreenDeployment/tree/master/Deploying_Application_using_ECS

### My Other Works
* https://github.com/sumanth979
