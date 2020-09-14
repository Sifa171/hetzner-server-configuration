#!/bin/bash

subscription-manager register --username=$RHN_USER --password=$RHN_PASSWORD
subscription-manager attach --pool=$(subscription-manager list --available --matches 'Employee SKU' --pool-only)
subscription-manager repos --disable=*
subscription-manager repos \
    --enable=rhel-8-for-x86_64-baseos-rpms \
    --enable=rhel-8-for-x86_64-appstream-rpms \
    --enable=rhel-8-for-x86_64-highavailability-rpms \
    --enable=ansible-2.9-for-rhel-8-x86_64-rpms \
    --enable=openstack-15-for-rhel-8-x86_64-rpms

yum update -y
