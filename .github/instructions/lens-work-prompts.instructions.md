---
applyTo: ".github/prompts/**/*.prompt.md,.github/stubPrompts/**/*.prompt.md"
---

# LENS Prompt Authoring Rules

- Keep prompts command-scoped and deterministic: one command entrypoint per file.
- Prefer light model pinning: avoid per-prompt `model:` keys unless a prompt has a hard requirement.
- Use current LENS vocabulary and canonical command names (`/preplan`, `/businessplan`, `/techplan`, `/devproposal`, `/sprintplan`, `/dev`).
- Keep alias references only when explicitly marked as compatibility aliases.
- Keep `_bmad/` paths explicit and control-repo relative.
- Preserve interactive workflow behavior: do not convert step-based workflows into batch generation.
- Avoid duplicating business logic that already exists in workflows, skills, or lifecycle contracts.
