#!/bin/bash

cd ../terraform 
IP=$(terraform output -raw public_ip)

cd ../
cat > ansible/inventory <<EOF
[web]
$IP 
EOF

echo "[+] Inventory generated with IP $IP"
