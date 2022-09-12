function vish -a cmd -d "Vim plugin manager for fish"
    switch "$cmd"
        case "" help h
            echo "Usage:   vish install <plugin>     Install plugins"
            echo "         vish uninstall <plugin>   Remove installed plugins"
            echo "         vish update               Update all installed plugins"
            echo "         vish list <search>        List installed plugins"
            echo "         vish init                 Initialise vish"
            echo -e \n
            echo "Example: vish install tpope/vim-fugitive"
            echo "         vish uninstall vim-fugitive"
            echo -e \n
            echo "Options:"
            echo "       -h or --help     Print this help message"
        case install i
            cd ~/.dotfiles
            if test -n "$argv[2]"
                echo "vish: Installing" $argv[2]
                set name (string split / $argv[2])
                git submodule add git@github.com:$argv[2] config/nvim/pack/vish/start/$name[2]
                nvim -c "helptags ALL" +qa
            else
                echo -e "vish: Please supply a GitHub repo name \n"
                vish --help
            end
            cd -
        case list ls
            set plugins (ls -1 ~/.config/nvim/pack/vish/start | awk '$0')
            string match --entire --regex -- "$argv[2]" $plugins
        case uninstall u
            cd ~/.dotfiles
            if test -n "$argv[2]"
                echo "vish: Uninstalling" $argv[2]
                git submodule deinit -f config/nvim/pack/vish/start/$argv[2]
                git rm -f config/nvim/pack/vish/start/$argv[2]
                rm -Rf .git/modules/config/nvim/pack/vish/start/$argv[2]
                nvim -c "helptags ALL" +qa
            else
                echo -e "vish: Please supply a plugin name \n"
                vish --help
            end
            cd -
        case update init
            cd ~/.dotfiles
            echo -e "vish: Updating plugins \n"

            git submodule update --remote --merge
            nvim -c "helptags ALL" +qa

            if test -L ~/.config/nvim/pack
                echo "vish: Already symlinked, skipping..."
            else
                echo "vish: Symlinking..."
                ln -s ~/.dotfiles/config/nvim/pack ~/.config/nvim/
            end
            cd -
    end
end
