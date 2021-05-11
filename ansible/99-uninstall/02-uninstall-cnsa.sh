### HOW To DELETE IBM Spectrum SCALE CNSA
oc project ibm-spectrum-scale-ns
oc scale sts ibm-spectrum-scale-gui --replicas=0
oc scale sts ibm-spectrum-scale-pmcollector --replicas=0
oc scale deployment ibm-spectrum-scale-operator --replicas=0
oc patch daemonset.apps/ibm-spectrum-scale-core --type merge --patch '{"spec":{"template":{"spec":{"nodeSelector":{"test":"remove"}}}}}'
oc delete -f spectrumscale/deploy/
oc delete -f spectrumscale/deploy/crds/ibm_v1_scalecluster_cr.yaml
oc delete -f spectrumscale/deploy/crds/ibm_v1_scalecluster_crd.yaml
oc delete sc ibm-spectrum-scale-internal
oc delete pvc datadir-ibm-spectrum-scale-pmcollector-0
oc delete pvc datadir-ibm-spectrum-scale-pmcollector-1
oc delete pv ocpworker01-pv
oc delete pv ocpworker02-pv
oc delete ns ibm-spectrum-scale-ns
oc label node ocpworker01 app.kubernetes.io/component-
oc label node ocpworker02 app.kubernetes.io/component-
oc label node ocpworker03 app.kubernetes.io/component-
