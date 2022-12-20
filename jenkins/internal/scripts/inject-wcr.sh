#!/usr/bin/env bash

set -e

PWD="$( cd $(dirname $0)/.. && pwd)"

promise_name="$(basename "$(dirname "${PWD}")")"

if ! which worker-resource-builder >/dev/null; then
	echo "worker-resource-builder not installed"
	exit 1
fi

promise_contents=$(worker-resource-builder \
  -k8s-resources-directory "${PWD}/resources" \
	-promise "${PWD}/../promise.yaml")

echo "$promise_contents" > "${PWD}/../promise.yaml"



