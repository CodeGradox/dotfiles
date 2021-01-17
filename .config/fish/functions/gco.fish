function gco --description "Helper for checking out branches."
    git rev-parse --git-dir > /dev/null 2>&1
    if test $status -ne 0
        echo "Folder is not a git repository."
        return 1
    end
    if set -q argv[1]
        git checkout $argv[1]
    else
        git checkout (git branch -vr | sed 's/origin\///' | fzf | awk '{ print $1 }')
    end
end

# complete -c gco -a '(git branch | string trim --left --char=" *")'
