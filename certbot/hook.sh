

sshpass -p root scp -o StrictHostKeyChecking=no \
  ${RENEWED_LINEAGE}/fullchain.pem \
  root@${OCI_CONTAINER_NAME}:/tmp/fullchain.pem

sshpass -p root scp -o StrictHostKeyChecking=no \
  ${RENEWED_LINEAGE}/privkey.pem \
  root@${OCI_CONTAINER_NAME}:/tmp/privkey.pem

sshpass -p root ssh -o StrictHostKeyChecking=no root@${OCI_CONTAINER_NAME} << EOF
  ./create-certificate.sh
  rm -f /tmp/fullchain.pem /tmp/privkey.pem
EOF
