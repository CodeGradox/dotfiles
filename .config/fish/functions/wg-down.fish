function wg-down
    # sudo wg-quick down wg0
    nmcli connection down ngc
    # Connection to self set up with 'nmcli connection add type ethernet con-name self ifname enp9s0'
    nmcli connection up self
end

