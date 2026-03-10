---
description: 'LENS Workbench prompt'
---

# lens-work.dev (Stub)

> **This is a stub.** Load and execute the full prompt from the release module.
> All `_bmad/` paths in the full prompt are relative to `bmad.lens.release/` — do NOT resolve paths against the user's main project repo.

```
Read and follow all instructions in: bmad.lens.release/_bmad/lens-work/prompts/lens-work.dev.prompt.md
```

feature/{initiativeId}                              ← initiative branch (merge target for epics)
  └── feature/{initiativeId}-{epic-key}             ← epic branch (merge target for stories)
        ├── feature/{initiativeId}-{epic-key}-{story-1}   ← first story (branches from epic)
        ├── feature/{initiativeId}-{epic-key}-{story-2}   ← chains off story-1
        └── feature/{initiativeId}-{epic-key}-{story-3}   ← chains off story-2

## Branch Discipline — Story-Branch-First + Story Chaining

**CRITICAL INVARIANT:** During task implementation, the agent MUST be on the **story branch**, not the epic branch.

- **Initiative branch** (`feature/{initiativeId}`) receives code ONLY via merged epic→initiative PRs.
- **Epic branch** (`feature/{initiativeId}-{epic-key}`) is a **merge-only** branch. Code enters it ONLY via merged story→epic PRs.
- **Story branch** (`feature/{initiativeId}-{epic-key}-{story-key}`) is where ALL task commits go.
- **Story chaining:** Story 1 branches from the epic. Story 2 branches from story 1. Story 3 branches from story 2. This allows continuous development without waiting for PR merges.
- Before each `git commit`, verify `git branch --show-current` returns the story branch.
- If on the epic branch, `git checkout {story-branch}` before committing.
- The **epic PR** targets the **initiative branch** (`feature/{initiativeId}`), NOT develop/main/master directly.
- The **initiative PR** (optional, post-epic) targets the **resolved integration branch** (whichever of develop/main/master actually exists).
