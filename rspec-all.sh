#!/bin/bash -l
for i in cms2 contact2 core files galleries lightbox links2 rbac sliders2 suite tags user_area2; do
  cd "ecm_${i}"
  echo $PWD
  bundle exec rspec spec
  cd ..
done

for i in cms2 contact2 core files galleries links2 rbac sliders2 tags user_area2; do
  cd "ecm_${i}_backend"
  echo $PWD
  bundle exec rspec spec
  cd ..
done


