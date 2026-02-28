---
applyTo: ".github/agents/**/*.agent.md,_bmad/lens-work/agents/**/*.yaml,_bmad/_config/custom/lens-work/**/*.yaml"
---

# LENS Agent Authoring Rules

- Keep agent files orchestration-focused; workflow details belong in prompt/workflow files.
- Use `.github/prompts/*.prompt.md` as the canonical subPrompt location.
- Keep custom-agent behavior aligned between `_bmad/lens-work/agents/` and `_bmad/_config/custom/lens-work/` when both are maintained.
- Preserve router behavior and command triggers unless the lifecycle contract changes in the same change.
- Do not introduce legacy agent names as primary routes; keep `@lens` as the unified router.
