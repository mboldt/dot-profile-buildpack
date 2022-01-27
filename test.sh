#!/usr/bin/env bash

set -euo pipefail

pack build test-dot-profile --path app --buildpack profile-buildpack
docker run --rm test-dot-profile env
