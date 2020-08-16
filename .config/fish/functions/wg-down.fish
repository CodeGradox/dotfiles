function wg-down
    # sudo wg-quick down wg0
    nmcli connection down ngc
    nmcli connection up 'Wired connection 1'
end

