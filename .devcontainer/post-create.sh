#!/usr/bin/env bash

set -euo pipefail

# Install pre-commit hooks
uvx pre-commit install

# Install apm dependencies
apm install --frozen
