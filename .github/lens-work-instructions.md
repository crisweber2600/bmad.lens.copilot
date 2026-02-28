# Copilot Instructions — BMAD Control Repos with LENS

This guide describes how to use GitHub Copilot with the LENS Workbench in this repository.

## Quick Start

1. Load `@lens` in Copilot Chat.
2. Start lifecycle routing with one of the phase commands:
   - `/preplan`
   - `/businessplan`
   - `/techplan`
   - `/devproposal`
   - `/sprintplan`
   - `/dev`
3. Use initiative/context commands as needed:
   - `/new-initiative`, `/new-domain`, `/new-service`, `/new-feature`
   - `/switch`, `/sync`, `/promote`, `/constitution`, `/onboard`, `/start`

Compatibility aliases may still appear in prompt text, but canonical names are the commands above.

## Copilot Customization Source of Truth

Use this ownership model when updating workflows:

- **Global Copilot rules:** `.github/copilot-instructions.md`
- **Scoped instruction files (`applyTo`):** `.github/instructions/`
- **Canonical runnable prompt files:** `.github/prompts/`
- **Installer seed prompts:** `.github/stubPrompts/`
- **Copilot custom agents:** `.github/agents/`
- **LENS runtime router/skills/workflows:** `_bmad/lens-work/`
- **LENS runtime state and logs:** `_bmad-output/lens-work/`

If docs and implementation disagree, update both in the same change.

## Operating Boundaries

- Run BMAD/LENS operations from the control repo root.
- Keep runtime artifacts in `_bmad-output/`.
- Keep governance artifacts in `TargetProjects/lens/lens-governance`.
- Do not write governance artifacts under `_bmad-output/lens-work/`.

## Workflow Execution Rules

When executing workflows through Copilot:

- For markdown workflows, follow the workflow file directly.
- For YAML workflows, load `_bmad/core/tasks/workflow.xml` first.
- Execute steps sequentially and save outputs after each step.
- Do not batch step files.

## LENS Agent Routing Model

`@lens` is the lifecycle router. It should:

- Route commands to prompt/workflow contracts.
- Delegate implementation behavior to skill/workflow files.
- Keep orchestration and implementation responsibilities separated.

Primary skill contracts are in:

- `_bmad/lens-work/skills/git-orchestration.md`
- `_bmad/lens-work/skills/state-management.md`
- `_bmad/lens-work/skills/discovery.md`
- `_bmad/lens-work/skills/constitution.md`
- `_bmad/lens-work/skills/checklist.md`

## Installer Behavior

The LENS installer should resolve Copilot assets in this order:

- Instructions: `.github/lens-work-instructions.md` (canonical), then legacy module docs fallback.
- Prompt seeding: `.github/stubPrompts/` (preferred), then module prompt fallback.

Installer writes prompt files to `.github/prompts/` and must not overwrite existing prompt files by default.

## Authoring Expectations (BMAD-aligned)

- Keep guidance deterministic and phase-aware.
- Prefer concise constraints over long duplicated process text.
- Keep markdown workflow/skill files llm-first (no runtime algorithm code blocks).
- Avoid introducing duplicate editable prompt/instruction sources.
