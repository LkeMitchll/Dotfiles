function nvish -a cmd -d "Neovim plugin manager for fish"
    cd ~/.dotfiles
    switch "$cmd"
        case "" help h
            echo "Usage:   nvish install <plugin>     Install plugins"
            echo "         nvish remove <plugin>      Remove installed plugins"
            echo "         nvish update               Update all installed plugins"
            echo "         nvish list                 List installed plugins"
            echo "         nvish init                 Initialise nvish"
            echo "         nvish help                 Print this help message"
            echo -e \n
            echo "Example: nvish install tpope/vim-fugitive"
            echo "         nvish remove vim-fugitive"
        case install i
            if test -n "$argv[2]"
                echo "nvish: Installing" $argv[2]
                set name (string split / $argv[2])
                git submodule add git@github.com:$argv[2] config/nvim/pack/plugins/start/$name[2]
            else
                echo -e "nvish: Please supply a GitHub repo name e.g. tpope/vim-fugitive\n"
            end
        case list ls
            set plugins (ls -1 ~/.dotfiles/config/nvim/pack/plugins/start | awk '$0')
            string match --entire --regex -- "$argv[2]" $plugins
        case remove r
            if test -n "$argv[2]"
                echo "nvish: Uninstalling" $argv[2]
                git submodule deinit -f config/nvim/pack/plugins/start/$argv[2]
                git rm -f config/nvim/pack/plugins/start/$argv[2]
                rm -Rf .git/modules/config/nvim/pack/plugins/start/$argv[2]
            else
                echo -e "nvish: Please supply a plugin name \n"
                nvish ls
            end
        case update u init
            echo -e "nvish: Updating plugins \n"
            git submodule update --remote --merge
    end
    cd -
end
