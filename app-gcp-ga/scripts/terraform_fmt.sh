#!/bin/bash

set -e

echo "Running code linting"
terraform fmt infrastructure
