# Dependency Review

Runs [actions/dependency-review-action](https://github.com/actions/dependency-review-action)

## Usage

```yaml
---
name: Dependency Review

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  dependency-review:
    name: Dependency Review
    permissions:
      contents: read
      pull-requests: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/dependency-review.yml@<commit SHA> # <version>
```
