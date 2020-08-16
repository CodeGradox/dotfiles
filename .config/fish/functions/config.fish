function config --wraps git
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME $argv
end

