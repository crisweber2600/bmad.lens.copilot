# bmad.lens.copilot

Canonical GitHub Copilot customization repository for LENS control repos.

## Purpose

This repo is the source of truth for control-repo Copilot customization assets.
The repository root contains the content that should be materialized into the
control repo `.gihub` folder.

- `agents/`
- `prompts/`
- `stubPrompts/`
- `instructions/`
- `copilot-instructions.md`
- `lens-work-instructions.md`

## Bootstrap Source

Initial bootstrap was seeded from `bmad.lens.release` branch `5.0`.

## Control-Repo Integration

Control repos (for example `NorthStarET.BMAD`) should clone this repo directly
as `controlRepo/.gihub`.

Control repos should keep `.gihub` gitignored to avoid pinning upstream repo
versions in control-repo commits.
