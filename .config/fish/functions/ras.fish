function ras
    set_color red
    echo "Starting rails server -e development -b 0.0.0.0"
    set_color normal
    rails server -e development -b 0.0.0.0
end