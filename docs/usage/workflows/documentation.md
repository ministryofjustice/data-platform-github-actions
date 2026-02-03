# Documentation

Build and publishes documentation using [`ministryofjustice/tech-docs-github-pages-publisher`](https://github.com/ministryofjustice/tech-docs-github-pages-publisher) to GitHub Pages

## Usage

```yaml
---
name: Documentation

on:
  pull_request:
    branches:
      - main
    paths:
      - "config/**"
      - "source/**"
      - ".github/workflows/documentation.yml"
  push:
    branches:
      - main
    paths:
      - "config/**"
      - "source/**"
      - ".github/workflows/documentation.yml"

permissions: {}

jobs:
  documentation:
    name: Documentation
    permissions:
      contents: read
      id-token: write
      pages: write
      pull-requests: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/documentation.yml@<commit SHA> # <version>
```
