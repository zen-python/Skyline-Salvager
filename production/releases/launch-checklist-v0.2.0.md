# Launch Checklist: v0.2.0

## Overall Status

CONDITIONAL

## Launch Mode

- GitHub-hosted production release for the playable vertical-slice prototype
- primary downloadable artifact is a Linux `arm64` package
- no storefront, legal, moderation, or live-ops expansion included in this
  launch scope

## Engineering And QA

- [x] dev, QA, and release gates pass in the current workspace
- [x] no open bug files exist in `production/qa/bugs/`
- [ ] rerun the full validation command set on the final publish commit
- [ ] rerun the Linux `arm64` export and confirm the packaged archive checksum

## Content And Packaging

- [x] release scope is documented as Story 001 plus Story 002
- [ ] verify generated release notes match the shipped scope
- [ ] verify the release page presents `v0.2.0` as the current stable version
- [ ] verify the release page includes the Linux `arm64` archive and checksum

## Distribution And Operations

- [x] GitHub Actions release automation exists
- [ ] dispatch the `Publish Release` workflow
- [ ] confirm tag `v0.2.0` and downloadable release entry are visible after
  publication

## Blocking Items

- publication has not been executed yet
- post-publish verification has not been recorded yet

## Conditional Items

- if the launch target expands beyond a GitHub Release, add storefront, legal,
  and support readiness artifacts before publishing

## Sign-Off List

- producer: release scope and publication timing
- qa-lead: validation evidence and blocker check
- technical-director or lead-programmer: workflow inputs and final candidate
  verification
