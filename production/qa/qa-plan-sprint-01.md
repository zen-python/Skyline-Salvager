# QA Plan: Sprint 01

## Scope

- Story 001: Magnetic Crate Pull

## Classification

- **Story 001**: Logic

## Automated Coverage Required

- unit tests for lock-on validity
- unit tests for pull-step progression
- unit tests confirming a stress event is emitted per completed pull step

## Manual Verification

- invalid target feedback is readable from normal gameplay camera height
- crate pull still feels legible while moving the rig

## Smoke Scope

- start a run
- lock onto a crate
- pull a crate at least three tiles
- confirm no crash or stuck state when releasing the beam mid-pull
