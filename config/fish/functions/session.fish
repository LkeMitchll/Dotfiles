# Create kitty 'session' on cd to folders containing a .kitty-session file
# Example .kitty-session file:
# { title: "example", command: "npm run start" }
# title = Tab title | command = Command to run
function session --on-variable PWD
  # Get the path of the ".kitty-session" file
  set session_file "$PWD/.kitty-session"

  if test -f $session_file
    # Extract the title and command from the file contents using sed
    set -l file_contents (cat "$session_file")
    set -l title (echo $file_contents | sed -E 's/.*title: "([^"]*)".*/\1/')
    set -l command (echo $file_contents | sed -E 's/.*command: "([^"]*)".*/\1/')

    if test -n "$title"
      # Find out if the tab already exists
      set -l tab_exists (kitty @ ls | grep "\"title\"\s*:\s*\"$title\"")
      if test -n "$tab_exists"
        echo Session: tab already exists
      else
        # Create the kitty tab
        kitty @ set-tab-title $title
        kitty @ launch --cwd=$PWD --title=server_$title --keep-focus
        kitty @ send-text --match=title:server_$title $command\u000D
        nvim +KittyOpenRunner README.md
      end
    end
  end
end
