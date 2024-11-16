#!/bin/bash

SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"

open -a "Visual Studio Code"
echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >>~/.zprofile
source ~/.zprofile


SETTINGS_DIR="$(dirname "$SETTINGS_FILE")"
if [ ! -d "$SETTINGS_DIR" ]; then
    mkdir -p "$SETTINGS_DIR"
fi

if [ ! -f "$SETTINGS_FILE" ]; then
    touch "$SETTINGS_FILE"
fi

if [ -w "$SETTINGS_FILE" ]; then

    cat <<EOF >$SETTINGS_FILE
{
    "workbench.colorTheme": "Monokai",
    "telemetry.telemetryLevel": "off",
    "workbench.startupEditor": "none",
    "workbench.settings.applyToAllProfiles": [
        {
            "[json]": {
                "editor.quickSuggestions": {
                    "strings": true
                },
                "editor.suggest.insertMode": "replace"
            },
            "window.zoomLevel": 0,
            "editor.formatOnType": true,
            "editor.fontSize": 18,
            "editor.fontWeight": "normal",
            "editor.fontFamily": "Fira Code",
            "editor.fontLigatures": true,
            "editor.tokenColorCustomizations": {
                "textMateRules": [
                    {
                        "name": "comment",
                        "scope": ["comment"],
                        "settings": {"fontStyle": "italic"}
                    },
                    {
                        "name": "Keyword Storage",
                        "scope": ["keyword", "keyword.control", "storage"],
                        "settings": {"fontStyle": "italic"}
                    },
                    {
                        "name": "Entity",
                        "scope": ["entity.name.method", "entity.name.type.class", "entity.other.attribute-name"],
                        "settings": {"fontStyle": "italic"}
                    },
                    {
                        "name": "Variable",
                        "scope": ["variable.language"],
                        "settings": {"fontStyle": "italic"}
                    }
                ]
            },

    "editor.guides.bracketPairs": true,
    "workbench.iconTheme": "material-icon-theme",
    "editor.fontSize": 18,
    "security.workspace.trust.banner": "never",
    "terminal.integrated.env.osx": {
        "CW_NEW_SESSION": "1"
    },
    "files.autoSave": "afterDelay",
    "editor.formatOnSave": true,
    "editor.fontFamily": "Fira Code",
    "editor.fontLigatures": true,
    "editor.linkedEditing": true,
    "editor.tabCompletion": "on",
    "editor.unicodeHighlight.nonBasicASCII": true,
    "editor.formatOnPaste": true,
    "editor.formatOnType": true,
    "diffEditor.codeLens": true,
    "editor.minimap.enabled": false,
    "files.trimFinalNewlines": true,
    "workbench.editor.closeOnFileDelete": true,
    "workbench.editor.preferHistoryBasedLanguageDetection": true,
    "files.insertFinalNewline": false,
    "files.trimTrailingWhitespace": true,
    "prettier.jsxSingleQuote": true,
    "prettier.singleQuote": true,
    "git.autofetch": true,
    "[javascript]": {
                "editor.defaultFormatter": "rvest.vs-code-prettier-eslint"
    }
        }
    ]
}
EOF

    wait

    echo "VS Code settings have been updated."
else
    echo "Error: $SETTINGS_FILE does not exist or is not writable." >&2
fi

extensions=(
    shyykoserhiy.vscode-spotify
    chakrounanas.turbo-console-log
    pflannery.vscode-versionlens
    shardulm94.trailing-spaces
    wayou.vscode-todo-highlight
    ban.spellright
    pnp.polacode
    streetsidesoftware.code-spell-checker-russian
    rvest.vs-code-prettier-eslint
    ms-python.debugpy
    ziyasal.vscode-open-in-github
    yzhang.markdown-all-in-one
    ghmcadams.lintlens
    zignd.html-css-class-completion
    oderwat.indent-rainbow
    wix.vscode-import-cost
    kisstkondoros.vscode-gutter-preview
    hwencc.html-tag-wrapper
    nicoespeon.hocus-pocus
    dbaeumer.vscode-eslint
    usernamehw.errorlens
    irongeek.vscode-env
    firefox-devtools.vscode-firefox-debug
    paulmolluzzo.convert-css-in-js
    kamikillerto.vscode-colorize
    streetsidesoftware.code-spell-checker
    wmaurer.change-case
    danielpinto8zz6.c-cpp-compile-run
    ms-vscode.cpptools
    aaron-bond.better-comments
    steoates.autoimport
    ferdelamad.styled-snippets
    ms-python.python
    ms-python.vscode-pylance
    esbenp.prettier-vscode
    christian-kohler.path-intellisense
    pkief.material-icon-theme
    xabikos.javascriptsnippets
    pranaygp.vscode-css-peek
    visualstudioexptteam.vscodeintellicode
    jeff-hykin.better-cpp-syntax
    formulahendry.auto-rename-tag
    formulahendry.auto-close-tag
    t7yang.hyper-javascript-snippets
    dsznajder.es7-react-js-snippets
    mikestead.dotenv
    eamodio.gitlens
    amirha.better-comments-2
)

for extension in "${extensions[@]}"; do
    if ! code --install-extension $extension; then
        echo "Error: Failed to install extension $extension." >&2
    fi
done

echo "All extensions have been installed!"
