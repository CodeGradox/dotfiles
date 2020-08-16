function fish_prompt --description="Custom terminal prompt"
    # set -l user (set_color blue) (whoami) (set_color normal)
    # set -l machine (set_color magenta) (hostname) (set_color normal)
    set -l directory (set_color '#4DA5FF') (pwd | sed "s|^$HOME|~|") (set_color normal)
    set -l chevron (set_color '#A3C1D7') ' >'

    # echo -ns $user '@' $machine ' ' $directory

    echo -ns [ $directory ] $chevron

    if test (git status --porcelain 2>/dev/null | wc -l) -eq 0
        echo -s (set_color '#6DA08C') (__fish_git_prompt) (set_color normal) ' '
    else
        echo -s (set_color yellow) (__fish_git_prompt) (set_color normal) ' '
    end
end
