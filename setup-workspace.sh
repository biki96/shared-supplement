#!/bin/bash

# Workspace Structure Setup Script
# Creates a standardized directory structure for organized work

set -e

WORK_ROOT="${1:-$HOME/Work}"
CURRENT_YEAR=$(date +%Y)

echo "Setting up workspace structure in: $WORK_ROOT"

# Define the directory structure
declare -a DIRECTORIES=(
    # Archive - for completed/old projects organized by year
    "archive/$CURRENT_YEAR"

    # Personal - personal projects and experiments
    "personal"

    # Products - active product development
    "products/ai"
    "products/tools"
    "products/platforms"

    # Research - research and learning projects
    "research/generative_ai"
    "research/mlops"
    "research/papers"

    # Shared - shared resources across all projects
    "shared/configs"
    "shared/notebooks"
    "shared/scripts"
    "shared/templates"
    "shared/dotfiles"
    "shared/docs"
    "shared/supplement"

    # Work Projects - client and professional work
    "work-projects/clients"
    "work-projects/internal"
    "work-projects/consulting"
)

# Create directories
for dir in "${DIRECTORIES[@]}"; do
    mkdir -p "$WORK_ROOT/$dir"
    echo "✓ Created: $dir"
done

# Create README files for each main directory
cat > "$WORK_ROOT/archive/README.md" << 'EOF'
# Archive

Completed and archived projects organized by year.

## Structure
- Each year has its own directory
- Move projects here when they're no longer active
- Keep documentation for future reference
EOF

cat > "$WORK_ROOT/personal/README.md" << 'EOF'
# Personal Projects

Personal projects, experiments, and hobby coding.

## Guidelines
- Side projects
- Learning experiments
- Open source contributions
- Personal tools
EOF

cat > "$WORK_ROOT/products/README.md" << 'EOF'
# Products

Active product development and applications.

## Categories
- **ai/**: AI-powered products and applications
- **tools/**: Developer tools and utilities
- **platforms/**: Platform projects

## Guidelines
- Each product should have its own directory
- Include README with setup instructions
- Maintain changelog
EOF

cat > "$WORK_ROOT/research/README.md" << 'EOF'
# Research

Research projects, explorations, and technical investigations.

## Categories
- **generative_ai/**: Generative AI research and experiments
- **mlops/**: MLOps practices and tools
- **papers/**: Paper implementations and notes

## Guidelines
- Document findings and learnings
- Include references and citations
- Keep experiment notebooks organized
EOF

cat > "$WORK_ROOT/shared/README.md" << 'EOF'
# Shared Resources

Shared configurations, scripts, and templates used across projects.

## Structure
- **configs/**: Configuration files and dotfiles
- **notebooks/**: Jupyter notebooks and templates
- **scripts/**: Utility scripts and tools
- **templates/**: Project templates and boilerplates
- **dotfiles/**: System dotfiles and configurations
- **docs/**: Documentation and guides
- **supplement/**: Additional utilities and helpers

## Guidelines
- Keep resources DRY (Don't Repeat Yourself)
- Document usage and dependencies
- Version control important configs
EOF

cat > "$WORK_ROOT/work-projects/README.md" << 'EOF'
# Work Projects

Professional client work and consulting projects.

## Categories
- **clients/**: Client projects (organize by client name)
- **internal/**: Internal company projects
- **consulting/**: Consulting engagements

## Guidelines
- Maintain clear client separation
- Include contracts/SOW references
- Track time and deliverables
- Respect NDAs and confidentiality
EOF

# Create root README
cat > "$WORK_ROOT/README.md" << EOF
# Work Directory Structure

Standardized workspace created on: $(date +%Y-%m-%d)

## Directory Overview

\`\`\`
Work/
├── archive/           # Completed/archived projects by year
├── personal/          # Personal projects and experiments
├── products/          # Active product development
├── research/          # Research and technical investigations
├── shared/            # Shared resources and configurations
└── work-projects/     # Professional client work
\`\`\`

## Quick Start

1. **New personal project**: \`personal/<project-name>\`
2. **New product**: \`products/<category>/<product-name>\`
3. **Research**: \`research/<topic>/<project-name>\`
4. **Client work**: \`work-projects/clients/<client-name>/<project>\`

## Archiving Projects

When a project is complete or no longer active:
\`\`\`bash
mv <project-path> archive/$CURRENT_YEAR/<project-name>
\`\`\`

## Maintenance

Run \`shared/supplement/setup-workspace.sh\` to ensure all directories exist.

---
Last updated: $(date +%Y-%m-%d)
EOF

# Create a .gitkeep in empty directories to preserve structure in git
find "$WORK_ROOT" -type d -empty -exec touch {}/.gitkeep \;

echo ""
echo "✅ Workspace structure created successfully!"
echo ""
echo "Directory structure:"
tree -L 2 "$WORK_ROOT" 2>/dev/null || find "$WORK_ROOT" -maxdepth 2 -type d
echo ""
echo "Next steps:"
echo "  1. Review README files in each directory"
echo "  2. Move existing projects to appropriate locations"
echo "  3. Add this structure to version control if desired"
