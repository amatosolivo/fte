# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### ✨ Features
- Initial Next.js project setup with Vite integration
- Automatic SemVer versioning with standard-version
- RQID (Request ID) tracking throughout CI/CD pipeline
- Automatic CHANGELOG.md generation
- Conventional commits enforcement with Husky and Commitlint
- GitHub Actions CI/CD pipeline with artifact management
- TypeScript support with strict type checking
- Tailwind CSS for styling
- Build information component showing RQID and version data

### 🏗️ Build System
- Configured Vite for Next.js integration
- Set up GitHub Actions for automated builds and releases
- Implemented artifact management with RQID correlation
- Added automated changelog generation with conventional-changelog

### 👷 CI/CD
- Multi-stage pipeline with lint, test, build, and release phases
- Automatic version bumping and tagging
- Pull request preview builds
- Release artifact creation and management