#!/bin/bash

# Trigger Snyk Code scan via import API
curl -X POST "https://api.snyk.io/v1/org/0b77e63a-6113-423c-900f-fc8c64feb95f/integrations/497609cd-3813-42fc-94b0-6a6089b6c801/import" \
-H "Authorization: token a3580c50-a2ed-4f00-891b-604ad8e3007c" \
-H "Content-Type: application/json" \
-d '{
  "target": {
    "owner": "LTFS-Senario",
    "name": "fastapi-sample-snyk",
    "branch": "main"
  }
}'

# Run Snyk Code test CLI with severity threshold to fail build if critical issues found
snyk code test --severity-threshold=low
