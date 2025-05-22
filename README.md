# Next.js + SemVer + RQID Project

A modern Next.js application with automatic semantic versioning, RQID tracking, and automated changelog generation.

## 🚀 Features

- **Next.js 14+** with App Router and TypeScript
- **Automatic SemVer** versioning with standard-version
- **RQID Tracking** throughout CI/CD pipeline
- **Auto-generated CHANGELOG** with conventional commits
- **GitHub Actions** CI/CD pipeline
- **Tailwind CSS** for styling
- **ESLint + TypeScript** for code quality
- **Husky + Commitlint** for conventional commits

## 📋 Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Start production server
npm start
```

## 🔄 Release Process

### Manual Release
```bash
# Patch release (bug fixes)
./release.sh patch

# Minor release (new features)
./release.sh minor

# Major release (breaking changes)
./release.sh major
```

### Using npm scripts
```bash
npm run release:patch
npm run release:minor
npm run release:major
```

## 📝 Commit Convention

This project follows [Conventional Commits](https://conventionalcommits.org/):

```bash
feat: add new feature
fix: resolve bug
docs: update documentation
style: formatting changes
refactor: code refactoring
perf: performance improvements
test: add tests
build: build system changes
ci: CI/CD changes
chore: maintenance tasks
```

## 🏗️ Build Information

The application includes real-time build information showing:
- **RQID**: Unique request/build identifier
- **Build Number**: Sequential build number
- **Version**: Current semantic version
- **Environment**: Current deployment environment

## 📊 RQID Tracking

Every build and deployment is tracked with a unique RQID that flows through:
- GitHub Actions workflows
- Build artifacts
- Application runtime
- Deployment logs
- Release notes

## 🤖 GitHub Actions

The CI/CD pipeline includes:

1. **Lint & Test**: Code quality checks
2. **Build**: Next.js with RQID
3. **Release**: Automated releases on version tags
4. **Preview**: PR preview builds

## 📁 Project Structure

```
├── src/
│   ├── app/                 # Next.js app directory
│   ├── components/          # React components
│   └── ...
├── .github/workflows/       # GitHub Actions
├── .husky/                  # Git hooks
├── CHANGELOG.md            # Auto-generated changelog
├── release.sh              # Release automation script
```

## 🔧 Configuration Files

- `.versionrc.json`: Standard-version configuration
- `.commitlintrc.json`: Commit message linting
- `.github/workflows/ci-cd.yml`: CI/CD pipeline

## 📈 Versioning Strategy

This project uses [Semantic Versioning](https://semver.org/):

- **PATCH** (x.x.1): Bug fixes and patches
- **MINOR** (x.1.x): New features (backwards compatible)
- **MAJOR** (1.x.x): Breaking changes

## 🤝 Contributing

1. Follow conventional commit format
2. Create feature branches from `main`
3. Ensure all tests pass
4. Update documentation as needed

## 📄 License

MIT License - see LICENSE file for details.