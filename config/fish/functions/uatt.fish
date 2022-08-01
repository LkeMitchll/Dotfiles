function uatt
    set uatt_seperator "**************************************"

    echo "UATT: Update All The Things!"
    echo $uatt_seperator

    echo \n"Updating Homebrew packages..."\n
    brew update
    brew bundle --file ~/.config/homebrew/Brewfile
    brew bundle --file ~/.config/homebrew/Brewfile.local
    brew upgrade
    echo \n"Homebrew packages up-to-date"
    echo $uatt_seperator

    echo \n"Updating ASDF plugins..."\n
    asdf plugin-update --all
    echo \n"ASDF plugins up-to-date"
    echo $uatt_seperator

    echo \n"Updating Neovim plugins..."\n
    cd ~/.config/nvim; and npm install; and npm update; and cd -
    nvim --headless -c 'autocmd User PackerComplete quitall' -c PackerSync
    echo \n\n"Neovim plugins up-to-date"
    echo $uatt_seperator

    echo \n"All done!"\n
end
