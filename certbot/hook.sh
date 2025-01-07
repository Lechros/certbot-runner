oci lb certificate update \
  --load-balancer-id ${LOAD_BALANCER_OCID} \
  --certificate-name ${CERTIFICATE_NAME} \
  --certificate-file ${RENEWED_LINEAGE}/fullchain.pem \
  --private-key-file ${RENEWED_LINEAGE}/privkey.pem