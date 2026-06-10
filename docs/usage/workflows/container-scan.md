# Container Scan

Builds a container image, scans it with [anchore/scan-action](https://github.com/anchore/scan-action), uploads SARIF, comments the summary on the pull request, and fails the workflow when high or critical fixable vulnerabilities are found.

## Inputs

|         Input          |   Type    | Required |     Default     |
| :--------------------: | :-------: | :------: | :-------------: |
|    `build-context`     | `string`  | `false`  |       `.`       |
| `clean-actions-runner` | `boolean` | `false`  |     `false`     |
|  `containerfile-path`  | `string`  | `false`  | `Containerfile` |

## Usage

```yaml
---
name: Container Scan

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  container-scan:
    name: Container Scan
    permissions:
      contents: read
      pull-requests: write
      security-events: write
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/container-scan.yml@<commit SHA> # <version>
    with:
      build-context: .
      containerfile-path: Containerfile
```
