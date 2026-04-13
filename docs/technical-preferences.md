# Technical Preferences

## Engine & Language

- **Engine**: Godot 4.6
- **Language**: GDScript
- **Rendering**: Forward+
- **Physics**: Built-in 2D physics

## Input & Platform

- **Target Platforms**: PC
- **Input Methods**: Keyboard/Mouse, Gamepad
- **Primary Input**: Keyboard/Mouse
- **Gamepad Support**: Partial
- **Touch Support**: None
- **Platform Notes**: UI must support keyboard focus and readable prompts for both mouse and controller users.

## Naming Conventions

- **Classes**: PascalCase
- **Variables**: snake_case
- **Signals/Events**: snake_case, past tense where possible
- **Files**: snake_case
- **Scenes/Prefabs**: PascalCase scene names
- **Constants**: UPPER_SNAKE_CASE

## Performance Budgets

- **Target Framerate**: 60 FPS
- **Frame Budget**: 16.6 ms
- **Draw Calls**: Under 250 in active gameplay scenes
- **Memory Ceiling**: 1200 MB

## Testing

- **Framework**: GdUnit4
- **Minimum Coverage**: Core formulas and beam-state transitions
- **Required Tests**: Balance formulas, gameplay systems, save-state safety if introduced

## Engine Specialists

- **Primary**: godot-specialist
- **Language/Code Specialist**: godot-gdscript-specialist
- **Shader Specialist**: godot-shader-specialist
- **UI Specialist**: ui-programmer
- **Additional Specialists**: godot-gdextension-specialist
- **Routing Notes**: Use the GDScript specialist for gameplay logic and the Godot specialist for scene, resource, and engine-architecture questions.
