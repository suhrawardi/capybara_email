#!/bin/bash

deliveries=( "test" "cache" )

for method in ${deliveries[@]}; do
  DELIVERY_METHOD=$method rspec spec
done
