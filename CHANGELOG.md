# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [1.0.1](https://github.com/amatosolivo/fte/compare/v1.0.0...v1.0.1) (2025-05-22)

## 1.0.0 (2025-05-22)


### ✨ Features

* initial Next.js project with SemVer, RQID, and auto-changelog ([429b338](https://github.com/amatosolivo/fte/commit/429b338eb71e8810cb36af1aeb3ce5784c449493))

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### ✨ Features
- Automatic SemVer versioning with standard-version
- RQID (Request ID) tracking throughout CI/CD pipeline
- Automatic CHANGELOG.md generation
- Conventional commits enforcement with Husky and Commitlint
- GitHub Actions CI/CD pipeline with artifact management
- TypeScript support with strict type checking
- Tailwind CSS for styling
- Build information component showing RQID and version data

### 🏗️ Build System
- Set up GitHub Actions for automated builds and releases
- Implemented artifact management with RQID correlation
- Added automated changelog generation with conventional-changelog

### 👷 CI/CD
- Multi-stage pipeline with lint, test, build, and release phases
- Automatic version bumping and tagging
- Pull request preview builds
- Release artifact creation and management