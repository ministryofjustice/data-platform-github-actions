# Zizmor

Runs [zizmorcore/zizmor](https://github.com/zizmorcore/zizmor)

## Usage

```yaml
---
name: Zizmor

on:
  pull_request:
    branches:
      - main
  push:
    branches:
      - main

permissions: {}

jobs:
  zizmor:
    name: Zizmor
    permissions:
      actions: read
      contents: read
      security-events: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/zizmor.yml@<commit SHA> # <version>
```
