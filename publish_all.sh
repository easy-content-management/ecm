#!/bin/bash -l
shopt -s expand_aliases
source ~/.bash_aliases

echo $PWD
for i in cms2 contact2 core files galleries links2 rbac sliders2 tags; do
  cd "ecm_${i}"
  echo $PWD
  publish_gem
  cd ..
done

for i in cms2 contact2 core files galleries lightbox links2 rbac sliders2 suite tags; do
  cd "ecm_${i}_backend"
  echo $PWD
  publish_gem
  cd ..
done
