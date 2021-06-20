function wg-down
  # sudo wg-quick down wg0
  nmcli connection down laft
  # Connection to self set up with 'nmcli connection add type ethernet con-name self ifname enp9s0'
  # nmcli connection up self
  nmcli connection up self
end

