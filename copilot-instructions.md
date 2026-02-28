# Copilot Instructions — Always-On Rules

This file contains only global rules that apply across the repository.
File-specific guidance lives under `.github/instructions/`.

## Core Operating Rules

- Treat `.github/` as the canonical source for Copilot prompts, agents, and instructions.
- Keep changes minimal, focused, and backward compatible unless a migration explicitly requires otherwise.
- Preserve BMAD governance boundaries:
	- Write runtime artifacts to `_bmad-output/` only.
	- Keep governance artifacts in the governance repo path (`TargetProjects/lens/lens-governance`), not under `_bmad-output/lens-work/`.
- Preserve llm-first authoring conventions for workflow/skill markdown in this repo.

## Workflow Execution Rules

- For markdown workflows, follow the workflow file directly.
- For YAML workflows, load `_bmad/core/tasks/workflow.xml` first and execute steps sequentially.
- Do not batch step files; load and complete one step at a time.

## Source-of-Truth Rules

- If docs and implementation conflict, update docs or implementation so they agree in the same change.
- Avoid introducing duplicate editable sources for prompts/instructions.
- Prefer explicit path references and keep command naming consistent with current LENS vocabulary (`/preplan`, `/businessplan`, `/techplan`, `/devproposal`, `/sprintplan`, `/dev`).
