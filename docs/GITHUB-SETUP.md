# GitHub Setup

This repo includes baseline GitHub Actions coverage for the current Godot
prototype.

## Included Workflows

- `.github/workflows/ci.yml`
- `.github/workflows/release-readiness.yml`

`ci.yml` is the normal merge gate. It runs:

- repo shell gates
- headless project boot
- headless prototype scene boot
- Story 001 runtime validation script

`release-readiness.yml` is the tag and manual release lane. It reruns the same
checks on `v*` tags and supports manual dispatch.

## Recommended Branch Protection

For `main`, enable:

1. Require a pull request before merging.
2. Require at least 1 approval.
3. Require conversation resolution.
4. Require status checks to pass.
5. Block force pushes.
6. Block branch deletion.

Recommended required checks:

- `Skyline CI / validate`
- `Release Readiness / release-readiness`

## Suggested Release Pattern

- `v0.1.0` for the initial playable prototype repo
- `v0.1.x` for validation and docs hardening
- `v0.2.0` for the next feature slice such as stress telegraph feedback

## Local Release Commands

```bash
git checkout main
git pull --ff-only
git tag -a v0.1.0 -m "Initial Skyline Salvager prototype"
git push origin main --follow-tags
gh release create v0.1.0 --title "v0.1.0" --notes "Initial Skyline Salvager prototype"
```
