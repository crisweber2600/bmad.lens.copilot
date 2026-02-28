# bmad.lens.copilot

Canonical GitHub Copilot customization repository for LENS control repos.

## Purpose

This repo is the source of truth for control-repo `.github` assets:

- `.github/agents/`
- `.github/prompts/`
- `.github/stubPrompts/`
- `.github/instructions/`
- `.github/copilot-instructions.md`
- `.github/lens-work-instructions.md`

## Bootstrap Source

Initial bootstrap was seeded from `bmad.lens.release` branch `5.0`.

## Control-Repo Integration

Control repos (for example `NorthStarET.BMAD`) should clone this repo as `bmad.lens.copilot` and materialize `controlRepo/.github` from this repo.

Control repos should keep `bmad.lens.copilot` and generated `.github` paths gitignored to avoid pinning upstream repo versions in control-repo commits.
