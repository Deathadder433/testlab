# MediaWiki Installation Using BlueGreen Deployment & Rolling Update
Lab Exercise

## Problem Statement
We want to automate the deployment of MediaWiki using.
* CFT with Ansbile

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
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/cf_output1.png" alt="cf_output">
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/cf_output2.PNG" alt="cf_output">

### Dynamic Inventory File
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/dynamic_inventory.png" alt="dynamic_inventory">

### Ansible Output
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/ansible1.png" alt="ansible1">
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/ansible2.png" alt="ansible2">

## MediaWiki Installation
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/output%20from%20lb.png" alt="mediaWiki">

## Architecture
### Blue Green Mode
<img src="https://github.com/Deathadder433/testlab/blob/main/steps/blue-green.png" alt="blue-green">

### Rolling Update Mode

<img src="https://github.com/Deathadder433/testlab/blob/main/steps/rolling.png" alt="rolling">



