cd /opt/sva/terraform/ocpbootstrap && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpmaster01 && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpmaster02 && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpmaster03 && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpworker01 && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpworker02 && terraform destroy -auto-approve
cd /opt/sva/terraform/ocpworker03 && terraform destroy -auto-approve