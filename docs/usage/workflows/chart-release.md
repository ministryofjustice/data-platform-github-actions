# Chart Release

Releases a Helm Chart to GitHub Container Registry

## Inputs

|    Input     |   Type   | Required | Default |
| :----------: | :------: | :------: | :-----: |
| `chart-path` | `string` | `false`  | `chart` |

## Usage

```yaml
---
name: Chart Release

on:
  push:
    tags:
      - "*"

permissions: {}

jobs:
  chart-release:
    name: Chart Release
    permissions:
      attestations: write
      contents: write
      id-token: write
      packages: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/chart-release.yml@<commit SHA> # <version>
    with:
      chart-name: example-chart-name
```
