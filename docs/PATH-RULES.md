# Path Rules

These are the human-readable replacements for Claude's path-scoped automatic
rules. Codex should consult this file before editing files in the listed paths.

| Path | Standards |
| --- | --- |
| `src/gameplay/**` | Use data-driven values, use delta time correctly, keep UI concerns out of gameplay |
| `src/core/**` | Avoid unnecessary allocations in hot paths, protect API stability, keep concurrency assumptions explicit |
| `src/ai/**` | Keep tuning data-driven, preserve debuggability, watch performance budgets |
| `src/networking/**` | Prefer server authority, version network messages, treat security as a default concern |
| `src/ui/**` | Keep UI from owning game state, support localization, preserve accessibility |
| `design/gdd/**` | Include overview, player fantasy, detailed rules, formulas, edge cases, dependencies, tuning knobs, and acceptance criteria |
| `design/narrative/**` | Preserve canon consistency, character voice, and declared lore boundaries |
| `assets/data/**` | Keep JSON valid, use stable naming conventions, and respect schema expectations |
| `tests/**` | Use clear names, make fixtures understandable, align tests to acceptance criteria |
| `prototypes/**` | Allow looser code quality, but document the hypothesis and keep a README |
| `assets/shaders/**` | Use clear naming, respect performance budgets, and keep cross-platform constraints visible |

## Operating Rule

Before editing a file in one of these paths:

1. identify the matching rule row
2. summarize the active standards
3. keep the edit plan compatible with that rule set
