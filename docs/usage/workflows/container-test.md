# Container Test

Builds and tests a container with [Container Structure Test](https://github.com/GoogleContainerTools/container-structure-test)

## Inputs

|         Input          |   Type    | Required |               Default               |
| :--------------------: | :-------: | :------: | :---------------------------------: |
|    `build-context`     | `string`  | `false`  |                 `.`                 |
| `clean-actions-runner` | `boolean` | `false`  |               `false`               |
|  `configuration-file`  | `string`  | `false`  | `test/container-structure-test.yml` |
|  `containerfile-path`  | `string`  | `false`  |           `Containerfile`           |

## Usage

```yaml
---
name: Container Test

on:
  pull_request:
    branches:
      - main

permissions: {}

jobs:
  container-test:
    name: Container Test
    permissions:
      contents: read
    uses: ministryofjustice/data-platform-github-actions/.github/workflows/container-test.yml@<commit SHA> # <version>
```
