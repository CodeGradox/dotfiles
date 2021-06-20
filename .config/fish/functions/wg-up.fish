# Import wireguard config to NetworkManager (nmcli)
#   nmcli connection import type wireguard file $FILE
# https://blogs.gnome.org/thaller/2019/03/15/wireguard-in-networkmanager/

function wg-up
  # sudo wg-quick up wg0
  nmcli connection up laft
end

