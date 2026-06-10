# Container Release

Builds and pushes a container image to GitHub Container Registry, generates an SBOM, creates build provenance and SBOM attestations, and verifies the published attestations.

## Inputs

|         Input          |   Type    | Required |     Default     |
| :--------------------: | :-------: | :------: | :-------------: |
|    `build-context`     | `string`  | `false`  |       `.`       |
| `clean-actions-runner` | `boolean` | `false`  |     `false`     |
|  `containerfile-path`  | `string`  | `false`  | `Containerfile` |

## Usage

```yaml
---
name: Container Release

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  container-release:
    name: Container Release
    permissions:
      attestations: write
      contents: read
      id-token: write
      packages: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/container-release.yml@<commit SHA> # <version>
```
