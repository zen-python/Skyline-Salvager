# Setup Engine Playbook

Use this to select the engine, pin the version, and populate a technical
preferences document for Codex-driven work.

## Inputs

- game concept if one exists
- target platforms
- prior engine experience
- desired language
- budget and scope constraints

## Recommendation Order

1. Prior engine experience
2. Target platform
3. 2D vs 3D scope
4. art direction and performance ambition
5. language comfort

## Engine Heuristics

- Godot: strongest default for 2D, low-budget solo work, and contained stylized 3D
- Unity: strongest default for mobile, mid-scope 3D, console-oriented indies, and C# workflows
- Unreal: strongest default for high-end 3D, large worlds, GAS-heavy action systems, and Blueprint plus C++ teams

## Process

1. Ask the user for the missing selection inputs.
2. Present 2-3 engine options with trade-offs.
3. Ask the user to choose one.
4. Confirm the engine version.
5. Populate a technical preferences file using `templates/technical-preferences.md`.
6. Record engine specialist routing for the chosen engine.

## Routing

- Godot -> `agents/specialists/godot-specialist.md`
- Unity -> `agents/specialists/unity-specialist.md`
- Unreal -> `agents/specialists/unreal-specialist.md`

## Output

- pinned engine and version
- language choice
- input and platform assumptions
- naming conventions
- performance defaults or placeholders
- testing framework guidance

## Stop Points

- engine selection
- version confirmation
- technical-preferences write approval
