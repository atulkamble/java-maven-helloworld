#!/bin/bash
# Setup script to enable 'mvn run' command
# This adds a shell function to your .zshrc

echo "Setting up 'mvn run' alias..."

# Backup existing .zshrc if it exists
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d%H%M%S)
    echo "✓ Backed up existing .zshrc"
fi

# Add mvn run function to .zshrc
cat >> ~/.zshrc << 'EOF'

# Maven run command (added by setup-mvn-run.sh)
mvn() {
    if [ "$1" = "run" ]; then
        shift
        command mvn compile exec:java "$@"
    else
        command mvn "$@"
    fi
}
EOF

echo "✓ Added 'mvn run' function to ~/.zshrc"
echo ""
echo "To activate, run:"
echo "  source ~/.zshrc"
echo ""
echo "Then you can use:"
echo "  mvn run"
