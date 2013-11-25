#!/bin/bash

source settings.conf

cat <<End-of-message
#####################################################
## Default login/password: $OS_USERNAME/$OS_PASSWORD
## tenant: $OS_TENANT_NAME
#####################################################
End-of-message
