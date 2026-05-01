# Homebrew Tap for mac-onboarding

Homebrew tap for installing `mac-onboarding` — export macOS configs and settings, install on a new Mac without Time Machine.

## Installation

```bash
brew tap oleg-koval/homebrew-tap
brew install mac-onboarding
```

## Usage

```bash
# Export configs from source Mac
mac-onboarding export ~/onboard.tar.gz

# Install on target Mac
mac-onboarding install ~/onboard.tar.gz

# Or pull live via Tailscale SSH (bridge mode)
mac-onboarding bridge pull
```

See [main repository](https://github.com/oleg-koval/mac-onboarding) for full documentation.

## What's Included

- 21 modules (bootstrap, brew, shell, git, system, hotkeys, and 15 more)
- Export/install/bridge modes
- Privacy-first design (secrets redacted)
- MDM-safe operation

## License

MIT
