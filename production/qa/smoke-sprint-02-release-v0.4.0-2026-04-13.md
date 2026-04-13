# Smoke Check: Sprint 02 Release Publish v0.4.0

**Date**: 2026-04-13
**Scope**: published Linux `arm64` graphical prototype prerelease verification
**Verdict**: PASS

## Published Release

- **Tag**: `v0.4.0`
- **Channel**: GitHub Release
- **Prerelease**: `true`
- **Workflow Run**: `24367062888`

## Verified Outcomes

- `Skyline CI` for commit `14abcf7` completed successfully before release
- `Publish Release` completed successfully
- release asset `skyline-salvager-linux-arm64.tar.gz` uploaded
- release asset `skyline-salvager-linux-arm64.tar.gz.sha256` uploaded

## Notes

- the publish workflow computed `v0.4.0` from the existing `v0.3.0` tag
- the release was published as a prerelease because the art-direction review
  still requires a follow-up pass on telegraph and HUD polish
