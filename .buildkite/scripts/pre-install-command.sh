#!/bin/bash
set -euo pipefail

source .buildkite/scripts/tooling.sh

add_bin_path(){
    mkdir -p "${WORKSPACE}/bin"
    export PATH="${WORKSPACE}/bin:${PATH}"
}

with_go_junit_report() {
    go install github.com/jstemmer/go-junit-report/v2@latest
}

with_goreleaser() {
    go install github.com/goreleaser/goreleaser@v1.6.3
}

# Required env variables:
#   WORKSPACE
#   SETUP_MAGE_VERSION
WORKSPACE=${WORKSPACE:-"$(pwd)"}
