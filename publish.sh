#!/bin/bash
set -ex
source ./.venv/bin/activate

quarto render
cd _site
aws s3 sync --delete --cache-control "max-age=0" . s3://query-farm-airport-docs/