# Installing mac-onboarding via Homebrew

## Quick Start

```bash
brew tap oleg-koval/homebrew-tap
brew install mac-onboarding
```

## Verify Installation

```bash
mac-onboarding --help
```

Should print the help message for all commands: `export`, `install`, `bridge pull`.

## First Run

```bash
# Copy example config
cp ~/.local/share/doc/mac-onboarding/onboard.yaml.example onboard.yaml

# Edit to set your source Mac (for bridge mode)
nano onboard.yaml

# Export from source Mac
mac-onboarding export ~/onboard.tar.gz

# Install on target Mac
mac-onboarding install ~/onboard.tar.gz
```

See [main repository](https://github.com/oleg-koval/mac-onboarding) for full documentation.

## Updating

```bash
brew upgrade mac-onboarding
```

## Uninstalling

```bash
brew uninstall mac-onboarding
brew untap oleg-koval/homebrew-tap
```

## Troubleshooting

**"brew: command not found"**
Install Homebrew: https://brew.sh

**"Unknown command: mac-onboarding"**
Ensure the tap is properly installed:
```bash
brew tap oleg-koval/homebrew-tap
brew install mac-onboarding
```

**Binary download fails**
Check your internet connection and try again:
```bash
brew install --verbose mac-onboarding
```

## Contributing

Issues and contributions: https://github.com/oleg-koval/mac-onboarding
