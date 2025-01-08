current_date=$(date + "%Y-%m-%d")
name="${CERTIFICATE_NAME}_${current_date}"

sshpass -p root ssh -o StrictHostKeyChecking=no root@${OCI_CONTAINER_NAME} \
  oci lb certificate create \
    --load-balancer-id ${LOAD_BALANCER_OCID} \
    --certificate-name ${name} \
    --certificate-file ${RENEWED_LINEAGE}/fullchain.pem \
    --private-key-file ${RENEWED_LINEAGE}/privkey.pem
