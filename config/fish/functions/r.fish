function r
    if test -e ./package-lock.json
        command npm run $argv
    end
    if test -e ./yarn.lock
        command yarn run $argv
    end
    if test -e ./pnpm-lock.yaml
        command pnpm run $argv
    end
    if test -e ./Gemfile.lock
        command bundle exec $argv
    end
end
