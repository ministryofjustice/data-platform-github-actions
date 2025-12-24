# Super-Linter

Runs [super-linter/super-linter](https://github.com/super-linter/super-linter)

## Inputs

|          Input           |   Type   | Required | Default |
| :----------------------: | :------: | :------: | :-----: |
| `super-linter-variables` | `string` | `false`  | `"{}"`  |

## Usage

```yaml
---
name: Super Linter

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  super-linter:
    name: Super Linter
    permissions:
      contents: read
      packages: read
      statuses: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/super-linter.yml@<commit SHA> # <version>
```

### Configuring Super-Linter Settings

```yaml
jobs:
  super-linter:
    name: Super Linter
    permissions:
      contents: read
      packages: read
      statuses: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/super-linter.yml@<commit SHA> # <version>
    with:
      super-linter-variables: |
        {
          "VALIDATE_X": false,
          "KEY": "value"
        }
```
