#!/bin/bash

function catch_errors() {
    printf "\npull_caf.sh failed!\n" >&2
    exit 1
}

trap catch_errors ERR;

git submodule deinit -f -- external/actor-framework
rm -rf .git/modules/external/actor-framework
git rm -f external/actor-framework

git add .
git commit -m "Temporarily remove actor-framework git submodule"
git push

git submodule add git@github.com:CppPhil/actor-framework.git external/actor-framework

git add .
git commit -m "Re-add actor-framework git submodule"
git push

exit 0

