# 🍺 Homebrew Tap

Official Homebrew formulae for **[promptctl](https://github.com/oleg-koval/promptctl)** - a CLI toolkit that transforms raw ideas into structured, optimized prompts.

## Install

```bash
brew tap oleg-koval/tap
brew install promptctl
```

## Verify

```bash
promptctl version
promptctl init
promptctl create "your idea here"
```

## Update

```bash
brew upgrade promptctl
```

## Available Formulae

| Formula | Description | Version |
|---------|-------------|---------|
| **promptctl** | Prompt engineering toolkit for developers | [![GitHub Release](https://img.shields.io/github/v/release/oleg-koval/promptctl)](https://github.com/oleg-koval/promptctl/releases) |

## What is promptctl?

**promptctl** is a zero-dependency CLI that does two things:

1. **`create`** - Transforms raw, unstructured intent into well-engineered prompts. You type what you need in plain English, it outputs a structured prompt with expert personas, task decomposition, output formats, and quality constraints.

2. **`run`** - Executes reusable YAML prompt templates with variable substitution, file reading, and conditional sections. Ships with 5 starter templates for code review, debugging, architecture decisions, commit messages, and code explanation.

```bash
# Transform rough idea into structured prompt
promptctl create "analyze my SaaS idea for the Dutch market, be critical"

# Run a template
promptctl review --file=src/auth.ts

# Pipe directly to your LLM
promptctl review --file=main.go | claude
```

**[Full docs & source →](https://github.com/oleg-koval/promptctl)**

## Troubleshooting

**Formula not found:**
```bash
brew untap oleg-koval/tap
brew tap oleg-koval/tap
brew install promptctl
```

**Outdated version:**
```bash
brew update
brew upgrade promptctl
```

## License

MIT
