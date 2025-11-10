#!/bin/bash

# Workspace Helper - Quick commands for workspace management

WORK_ROOT="${WORK_ROOT:-$HOME/Work}"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

show_help() {
    cat << EOF
${BLUE}Workspace Helper${NC}

Usage: workspace <command> [arguments]

Commands:
  ${GREEN}setup${NC}              Set up the complete directory structure
  ${GREEN}new-project${NC}        Create a new project (interactive)
  ${GREEN}archive${NC} <path>     Move a project to archive
  ${GREEN}list${NC}               Show directory structure
  ${GREEN}goto${NC} <category>    Quick navigation (use with: cd \$(workspace goto personal))

Examples:
  workspace setup
  workspace new-project
  workspace archive ~/Work/personal/old-project
  workspace list
  cd \$(workspace goto personal)

EOF
}

setup_workspace() {
    bash "$WORK_ROOT/shared/supplement/setup-workspace.sh" "$WORK_ROOT"
}

new_project() {
    echo -e "${BLUE}Create New Project${NC}"
    echo ""
    echo "Select category:"
    echo "  1) Personal"
    echo "  2) Product"
    echo "  3) Research"
    echo "  4) Work/Client"
    echo ""
    read -p "Choice [1-4]: " category

    case $category in
        1)
            read -p "Project name: " name
            PROJECT_PATH="$WORK_ROOT/personal/$name"
            ;;
        2)
            echo "  a) AI"
            echo "  b) Tools"
            echo "  c) Platforms"
            read -p "Subcategory [a-c]: " subcat
            read -p "Project name: " name
            case $subcat in
                a) PROJECT_PATH="$WORK_ROOT/products/ai/$name" ;;
                b) PROJECT_PATH="$WORK_ROOT/products/tools/$name" ;;
                c) PROJECT_PATH="$WORK_ROOT/products/platforms/$name" ;;
                *) echo "Invalid choice"; return 1 ;;
            esac
            ;;
        3)
            echo "  a) Generative AI"
            echo "  b) MLOps"
            echo "  c) Papers"
            read -p "Subcategory [a-c]: " subcat
            read -p "Project name: " name
            case $subcat in
                a) PROJECT_PATH="$WORK_ROOT/research/generative_ai/$name" ;;
                b) PROJECT_PATH="$WORK_ROOT/research/mlops/$name" ;;
                c) PROJECT_PATH="$WORK_ROOT/research/papers/$name" ;;
                *) echo "Invalid choice"; return 1 ;;
            esac
            ;;
        4)
            read -p "Client name: " client
            read -p "Project name: " name
            PROJECT_PATH="$WORK_ROOT/work-projects/clients/$client/$name"
            ;;
        *)
            echo "Invalid choice"
            return 1
            ;;
    esac

    mkdir -p "$PROJECT_PATH"

    # Create basic project structure
    cat > "$PROJECT_PATH/README.md" << EOF
# $name

Created: $(date +%Y-%m-%d)

## Description

[Add project description]

## Setup

\`\`\`bash
# Add setup instructions
\`\`\`

## Usage

[Add usage instructions]

## Notes

[Add any additional notes]
EOF

    echo -e "${GREEN}✓${NC} Project created: $PROJECT_PATH"
    echo ""
    echo "Next steps:"
    echo "  cd $PROJECT_PATH"
}

archive_project() {
    if [ -z "$1" ]; then
        echo "Usage: workspace archive <project-path>"
        return 1
    fi

    YEAR=$(date +%Y)
    PROJECT_NAME=$(basename "$1")
    ARCHIVE_PATH="$WORK_ROOT/archive/$YEAR/$PROJECT_NAME"

    if [ ! -d "$1" ]; then
        echo "Error: Project path does not exist: $1"
        return 1
    fi

    mkdir -p "$WORK_ROOT/archive/$YEAR"

    echo -e "${YELLOW}Archive project:${NC} $1"
    echo -e "${YELLOW}To:${NC} $ARCHIVE_PATH"
    read -p "Continue? [y/N]: " confirm

    if [[ $confirm == [yY] ]]; then
        mv "$1" "$ARCHIVE_PATH"
        echo -e "${GREEN}✓${NC} Project archived successfully"
    else
        echo "Cancelled"
    fi
}

list_structure() {
    echo -e "${BLUE}Workspace Structure${NC}"
    echo ""
    if command -v tree &> /dev/null; then
        tree -L 3 -d "$WORK_ROOT"
    else
        find "$WORK_ROOT" -maxdepth 3 -type d | sed "s|$WORK_ROOT|Work|"
    fi
}

goto_category() {
    case $1 in
        personal) echo "$WORK_ROOT/personal" ;;
        products) echo "$WORK_ROOT/products" ;;
        research) echo "$WORK_ROOT/research" ;;
        work) echo "$WORK_ROOT/work-projects" ;;
        clients) echo "$WORK_ROOT/work-projects/clients" ;;
        shared) echo "$WORK_ROOT/shared" ;;
        archive) echo "$WORK_ROOT/archive" ;;
        *) echo "$WORK_ROOT" ;;
    esac
}

# Main command router
case "${1:-help}" in
    setup) setup_workspace ;;
    new-project|new) new_project ;;
    archive) archive_project "$2" ;;
    list|ls) list_structure ;;
    goto|cd) goto_category "$2" ;;
    help|--help|-h) show_help ;;
    *)
        echo "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
