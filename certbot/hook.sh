current_date=$(date +"%Y-%m-%d")
name="${CERTIFICATE_NAME}-${current_date}"

escaped_name=$(printf "%q" "${name}")

sshpass -p root scp -o StrictHostKeyChecking=no \
  ${RENEWED_LINEAGE}/fullchain.pem \
  root@${OCI_CONTAINER_NAME}:/tmp/fullchain.pem

sshpass -p root scp -o StrictHostKeyChecking=no \
  ${RENEWED_LINEAGE}/privkey.pem \
  root@${OCI_CONTAINER_NAME}:/tmp/privkey.pem

sshpass -p root ssh -o StrictHostKeyChecking=no root@${OCI_CONTAINER_NAME} \
  oci lb certificate create \
    --load-balancer-id ${LOAD_BALANCER_OCID} \
    --certificate-name "${escaped_name}" \
    --public-certificate-file /tmp/fullchain.pem \
    --private-key-file /tmp/privkey.pem

sshpass -p root ssh -o StrictHostKeyChecking=no root@${OCI_CONTAINER_NAME} \
  rm -f /tmp/fullchain.pem /tmp/privkey.pem