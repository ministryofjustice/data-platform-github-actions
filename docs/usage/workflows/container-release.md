# Container Release

Builds and pushes a container image to GitHub Container Registry, generates an SBOM, creates build provenance and SBOM attestations, and verifies the published attestations.

## Inputs

|        Input         |   Type    | Required |     Default     |
| :------------------: | :-------: | :------: | :-------------: |
|   `build-context`    | `string`  | `false`  |       `.`       |
|    `clean-runner`    | `boolean` | `false`  |     `false`     |
| `containerfile-path` | `string`  | `false`  | `Containerfile` |

## Usage

```yaml
---
name: Container Release

on:
  push:
    tags:
      - "*"

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

## Verification

You can verify the published provenance attestation and inspect the SBOM attestation using the GitHub CLI.

Prerequisites:

- `gh` CLI installed and authenticated (`gh auth status`)
- `jq` installed for JSON filtering

Set these variables:

```bash
IMAGE="ghcr.io/<org>/<repo>:<tag>"
REPOSITORY="<org>/<repo>"
SIGNER_WORKFLOW="ministryofjustice/data-platform-github-actions/.github/workflows/container-release.yml"
```

Verify build provenance attestation:

```bash
gh attestation verify "oci://${IMAGE}" \
  --repo "${REPOSITORY}" \
  --signer-workflow "${SIGNER_WORKFLOW}"
```

Download all attestations for the image digest:

```bash
gh attestation download "oci://${IMAGE}" \
  --repo "${REPOSITORY}"
```

This writes a local file named `sha256:<digest>.jsonl` in the current directory.

Extract the CycloneDX SBOM and write it to disk:

```bash
FILE="$(ls -t sha256:*.jsonl | head -n1)"

jq -r '.dsseEnvelope.payload | @base64d | fromjson
  | select(.predicateType=="https://cyclonedx.org/bom")
  | .predicate' "${FILE}" > sbom.cyclonedx.json
```

Show a quick SBOM summary:

```bash
jq '{bomFormat, specVersion, componentCount: (.components | length)}' sbom.cyclonedx.json
```
