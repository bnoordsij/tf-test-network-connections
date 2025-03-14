# Test network connections

run these commands
```bash
./secrets/generate-id-rsa.sh
terraform init
terraform apply
```

This should create 2 EC2 instances without errors

To ssh into the instances use:
```bash
echo $(terraform output -json | jq -r '.instance_ips.value[0]')
ip=
ssh -i ./secrets/id_rsa ec2-user@$ip
```

To check public IP address use:
```bash
curl $ip
```

It might be that you have to manually start nginx via ssh anyways
```
sudo systemctl start nginx
```
