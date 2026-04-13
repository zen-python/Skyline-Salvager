# Story 002 Test Evidence

**Story**: `production/epics/salvage/story-002-rooftop-stress-telegraph.md`
**Date**: 2026-04-13

## Automated Runtime Coverage

File:

- `tests/runtime/story_002_runtime_check.gd`

Covered scenarios:

- telegraph starts idle before any stress event is applied
- first pull stress event updates the panel with the newest tile and stress value
- later pull steps replace stale telegraph tile data with the latest stressed tile
- warning-state text appears when a tile reaches the warning threshold below collapse

Engine-executed runtime check:

- `godot --headless --path . --script res://tests/runtime/story_002_runtime_check.gd`
- result: `RUNTIME CHECK PASS: Story 002 rooftop stress telegraph`

## Manual Smoke Notes

Scene:

- `scenes/PrototypeMain.tscn`

Manual interactions represented by the prototype scene:

- `L` acquires the current crate target
- `Space` starts the beam and advances one pull tick
- the rooftop stress panel updates after each completed pull step
- the panel color shifts at warning level while continuing to show tile and threshold data

## Result

- runtime telegraph coverage passed in headless Godot
- prototype scene loaded successfully in a headless smoke pass
