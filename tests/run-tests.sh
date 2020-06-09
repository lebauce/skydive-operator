#!/bin/sh

# Deploy the custom resource definitions
kubectl create -f deploy/crds/charts.helm.k8s.io_skydives_crd.yaml
kubectl create -f deploy/crds/charts.helm.k8s.io_netflowcollectors_crd.yaml

# Install the operator
kubectl create -f deploy/service_account.yaml
kubectl create -f deploy/role.yaml
kubectl create -f deploy/role_binding.yaml
kubectl create -f deploy/operator.yaml

# Create a general Skydive resource
kubectl create -f deploy/crds/charts.helm.k8s.io_v1alpha1_skydive_cr.yaml
# Create Skydive as netflow collector resource
kubectl create -f deploy/crds/charts.helm.k8s.io_v1alpha1_netflowcollector_cr.yaml

# Do some tests...
