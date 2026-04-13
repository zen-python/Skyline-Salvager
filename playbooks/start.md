# Start Playbook

Use this to orient a Codex session and route the project to the right workflow.

## Step 1: Detect Project State

Inspect:

- engine configuration
- existence of a concept document
- existence of source code
- presence of prototypes
- number of design documents
- presence of sprint or milestone artifacts

## Step 2: Ask The User Where They Are

Present one of these paths:

1. No idea yet
2. Vague idea
3. Clear concept
4. Existing work

## Step 3: Route

- Path 1 -> `playbooks/brainstorm.md`
- Path 2 -> `playbooks/brainstorm.md`
- Path 3 -> `playbooks/brainstorm.md` or engine setup, depending on the user's choice
- Path 4 -> audit existing artifacts, then choose the next missing phase

## Step 4: Stop For Decision

Recommend the next playbook and wait for approval before writing.
