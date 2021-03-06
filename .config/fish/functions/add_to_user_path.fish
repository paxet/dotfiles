# All credit goes to @dideler
# https://github.com/dideler/dotfiles/blob/master/.config/fish/functions/add_to_user_path.fish
function add_to_user_path --description "Persistently prepends to your PATH via fish_user_paths"
  for path in $argv
    if not contains $path $fish_user_paths
      set --universal --export fish_user_paths $path $fish_user_paths
    end
  end
end
