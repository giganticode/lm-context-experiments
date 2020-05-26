#!/bin/bash
set -euo pipefail

COMMIT_HASH="$1"
PATH_TO_DATA="$2"
OTHER_PARAMS="$3"
OUTPUT_PATH="$4"
OUTPUT_METRICS="$5"

git clone https://github.com/giganticode/lm-context-analysis
cd lm-context-analysis
git checkout "$COMMIT_HASH"
virtualenv -p '3.6.9' .venv
source .venv/bin/activate
pip install -r requirements.txt
echo "$OTHER_PARAMS"
python main.py --data "$PATH_TO_DATA" --save "$OUTPUT_PATH" --output_metrics "$OUTPUT_METRICS" $OTHER_PARAMS

cd ..
rm -rf lm-context-analysis .venv
