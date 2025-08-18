#!/bin/bash

WORKSPACE=$(terraform workspace show)

if [ "$WORKSPACE" = "prod" ]; then
  echo "WARNING: You're about to change PRODUCTION!"
  echo "Type 'yes' to continue:"
  read confirmation
  if [ "$confirmation" != "yes" ]; then
    echo "Cancelled."
    exit 1
  fi
fi

terraform apply -var-file="environments/${WORKSPACE}.tfvars" "$@"