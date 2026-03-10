---
model: Claude Sonnet 4.6 (copilot)
description: 'Bootstrap a new control repo and onboard the user to lens-work v2'
---

# lens-work.onboard (Stub)

> **This is a stub.** Load and execute the full prompt from the release module.
> All `_bmad/` paths in the full prompt are relative to `bmad.lens.release/` — do NOT resolve paths against the user's main project repo.

```
Read and follow all instructions in: bmad.lens.release/_bmad/lens-work/prompts/lens-work.onboard.prompt.md
```

_bmad-output/
└── lens-work/
    ├── personal/
    └── initiatives/

### Step 2: Run /onboard

Execute the onboard workflow at `_bmad/lens-work/workflows/utility/onboard/`.

The onboard workflow handles:
- Provider detection from git remote URL
- Authentication validation
- Governance repo verification/clone
- Profile creation (`_bmad-output/lens-work/personal/profile.yaml`)
- TargetProjects bootstrap from governance `repo-inventory.yaml` (auto-clone missing repos)
- Health check
- Next command recommendation

## Prerequisites

- Control repo must be a git repository with a remote configured
- `bmad.lens.release/_bmad/lens-work/` must be accessible (release module)
- `git` available in PATH
