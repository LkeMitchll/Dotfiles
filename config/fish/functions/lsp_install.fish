function lsp_install
  set npm_packages \
    biome \
    stylelint-lsp \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted

  for package in $npm_packages
    echo "Installing $package..."
    npm install -g $package
  end

  echo "All packages installed successfully."
end
