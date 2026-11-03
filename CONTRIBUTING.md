# Contributing to Hyperion Optimizer

Hyperion Optimizer is a modified fork of [RyTuneX](https://github.com/rayenghanmi/RyTuneX)
by Rayen Ghanmi. Bug reports and feature requests about the original project belong at
<https://github.com/rayenghanmi/RyTuneX/issues>.

## How to Contribute

1. **Fork the repository**: Fork <https://github.com/XTENSEI/WindowsTuneX>.
2. **Make your changes**: Clone your fork locally and create a branch from `main`.
3. **Commit changes**: Keep messages clear and descriptive. Sign off your commits with `git commit -s`.
4. **Submit a pull request**: Open it against `main` in this repository.

The project builds only on Windows. See [.github/workflows/build.yml](.github/workflows/build.yml)
for the build and packaging steps. GitHub Actions runs the same build on every push.

## Guidelines

- **Coding Style**: Follow the existing style. Consistency helps readability and review.
- **Commit Messages**: Explain what changed and why.
- **Documentation**: Document new features or behavior changes.
- **Testing**: Test your changes on Windows before opening a pull request. The maintainer
  cannot build or run the app on Linux.

## Getting Help

Open an issue at <https://github.com/XTENSEI/WindowsTuneX/issues>.

Thank you for helping improve Hyperion Optimizer.
