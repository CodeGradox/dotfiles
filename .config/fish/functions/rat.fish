function rat
    set_color red
    echo "Running rails tests"
    set_color normal
    set -lx RAILS_ENV test
    rails test
end

