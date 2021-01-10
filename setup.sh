echo "Creating the stack"
aws cloudformation create-stack --stack-name demo-stack --template-body blueGreen.yaml --parameters parameters.json

echo "Dynamically create the invertory file for ansible"
python3 dynamicInventory.py demo-stack us-east-1

echo "Run Ansible Playbook to deploy mediaWiki"
ansible-playbook playbook.yaml -i invertory.txt
