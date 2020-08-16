# Import wireguard config to NetworkManager (nmcli)
#   nmcli connection import type wireguard file $FILE

function wg-up
    # sudo wg-quick up wg0
    nmcli connection up ngc
end

