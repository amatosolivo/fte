#!/bin/bash

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para logging con timestamp
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}"
}

warn() {
    echo -e "${YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}"
}

info() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')] INFO: $1${NC}"
}

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                    RELEASE AUTOMATION                         ║"
echo "║              Next.js + SemVer + RQID                          ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Verificar dependencias
command -v git >/dev/null 2>&1 || { error "Git is required but not installed."; exit 1; }
command -v node >/dev/null 2>&1 || { error "Node.js is required but not installed."; exit 1; }
command -v npm >/dev/null 2>&1 || { error "npm is required but not installed."; exit 1; }

# Verificar que estamos en main/master
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT_BRANCH" != "main" && "$CURRENT_BRANCH" != "master" ]]; then
    error "Must be on main/master branch to release. Currently on: $CURRENT_BRANCH"
    exit 1
fi

# Verificar que el working directory esté limpio
if [[ -n $(git status --porcelain) ]]; then
    error "Working directory not clean. Commit or stash changes first."
    git status --short
    exit 1
fi

# Obtener tipo de bump (default: patch)
BUMP_TYPE=${1:-patch}

# Validar tipo de bump
if [[ ! "$BUMP_TYPE" =~ ^(patch|minor|major|prerelease)$ ]]; then
    error "Invalid bump type: $BUMP_TYPE. Use: patch, minor, major, or prerelease"
    exit 1
fi

log "Starting release process with bump type: $BUMP_TYPE"

# Mostrar versión actual
CURRENT_VERSION=$(node -p "require('./package.json').version")
info "Current version: $CURRENT_VERSION"

# Pull latest changes
log "Pulling latest changes..."
git pull origin $CURRENT_BRANCH

# Install dependencies
log "Installing/updating dependencies..."
npm ci

# Run tests and linting
log "Running linting and type checking..."
npm run lint || { error "Linting failed"; exit 1; }

# Build project to ensure it compiles
log "Building project to verify compilation..."
npm run build || { error "Build failed"; exit 1; }

# Generate release with standard-version (includes CHANGELOG)
log "Generating release with standard-version..."
npm run release:$BUMP_TYPE || { error "Release generation failed"; exit 1; }

# Obtener nueva versión
NEW_VERSION=$(node -p "require('./package.json').version")
log "New version: $NEW_VERSION"

# Mostrar changelog reciente
if [[ -f "CHANGELOG.md" ]]; then
    info "Recent changelog entries:"
    echo -e "${YELLOW}"
    head -n 20 CHANGELOG.md
    echo -e "${NC}"
fi

# Confirmar push
echo ""
warn "About to push version $NEW_VERSION to remote repository."
read -p "Continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    warn "Release cancelled by user"
    exit 0
fi

# Push cambios y tags
log "Pushing changes and tags to remote..."
git push --follow-tags origin $CURRENT_BRANCH || { error "Failed to push to remote"; exit 1; }

# Success message
echo -e "${GREEN}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                      RELEASE SUCCESSFUL! 🎉                  ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

log "Release $NEW_VERSION completed successfully!"
info "Version $NEW_VERSION has been released and pushed to remote."
info "CHANGELOG.md has been automatically updated."

# Mostrar enlaces útiles si gh CLI está disponible
if command -v gh >/dev/null 2>&1; then
    REPO_URL=$(gh repo view --json url -q .url 2>/dev/null)
    if [[ -n "$REPO_URL" ]]; then
        echo ""
        info "Useful links:"
        echo "  🔗 Repository: $REPO_URL"
        echo "  🚀 Actions: $REPO_URL/actions"
        echo "  📋 Releases: $REPO_URL/releases"
        echo "  📝 Latest Release: $REPO_URL/releases/tag/v$NEW_VERSION"
    fi
fi

echo ""
log "GitHub Actions will now automatically:"
echo "  • Build the application with RQID: $(date +%s)"
echo "  • Run tests and linting"
echo "  • Create release artifacts"
echo "  • Deploy to environments (if configured)"
echo ""
log "Monitor the build status in GitHub Actions! 🚀"