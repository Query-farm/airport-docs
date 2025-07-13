#!/bin/bash
set -ex
source ./.venv/bin/activate

quarto render
cd _site
aws s3 sync --delete --cache-control "public, max-age=15" . s3://query-farm-airport-docs/
