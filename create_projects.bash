#!/bin/bash

###
## Create projects
###
# oc new-project si-ms-account-rate;
# oc new-project si-ms-affinity-group;
# oc new-project si-ms-attendance-point;
# oc new-project si-ms-card;
# oc new-project si-ms-card-data;
# oc new-project si-ms-card-limit;
# oc new-project si-ms-holder-additional;
# oc new-project si-ms-holder-balance;
# oc new-project si-ms-holder-billing-history;
# oc new-project si-ms-holder-by-document;
# oc new-project si-ms-holder-data;
# oc new-project si-ms-holder-movement;
# oc new-project si-ms-holder-rate;
# oc new-project si-ms-last-invoice-maturity;
# oc new-project si-ms-product-resume;
# oc new-project si-ms-services-holder;
# oc new-project si-ms-processing;

oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-account-rate:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-affinity-group:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-attendance-point:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-card:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-card-data:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-card-limit:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-additional:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-balance:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-billing-history:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-by-document:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-data:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-movement:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-holder-rate:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-last-invoice-maturity:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-product-resume:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-services-holder:default -n sippe;
oc policy add-role-to-user system:image-puller system:serviceaccount:si-ms-processing:default -n sippe;
