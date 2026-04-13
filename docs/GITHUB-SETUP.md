# GitHub Setup

This repo includes baseline GitHub Actions coverage for the current Godot
prototype.

## Included Workflows

- `.github/workflows/ci.yml`
- `.github/workflows/release-readiness.yml`
- `.github/workflows/release.yml`

`ci.yml` is the normal merge gate. It runs:

- repo shell gates
- headless project boot
- headless prototype scene boot
- Story 001 runtime validation script
- Story 002 runtime validation script

`release-readiness.yml` validates tagged releases and supports manual
readiness checks without publishing a release.

`release.yml` is the publish lane. It runs the same validation suite, computes
the next semantic version from the latest `v*` tag, creates the new tag, and
publishes the GitHub Release.

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

## Release Workflow

Use the GitHub Actions `Publish Release` workflow for the normal release path.

Inputs:

- `release_type`: `patch`, `minor`, or `major`
- `prerelease`: `true` or `false`

Expected behavior:

1. The workflow reruns the shell gates and both runtime checks.
2. It finds the latest existing `v*` tag.
3. It computes the next semantic version from the selected bump type.
4. It creates and pushes the new annotated tag.
5. It publishes a GitHub Release with generated notes.

For the current repo state, a `minor` release from `v0.1.0` will produce
`v0.2.0`.

## Manual Fallback Commands

```bash
git checkout main
git pull --ff-only
git tag -a v0.2.0 -m "Rooftop stress telegraph"
git push origin main --follow-tags
gh release create v0.2.0 --title "v0.2.0" --generate-notes
```
