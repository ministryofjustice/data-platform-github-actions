# Spell Check

Runs [streetsidesoftware/cspell-action](https://github.com/streetsidesoftware/cspell-action)

## Usage

```yaml
---
name: Spell Check

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  spell-check:
    name: Dependency Review
    permissions:
      contents: read
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/spell-check.yml@<commit SHA> # <version>
```
