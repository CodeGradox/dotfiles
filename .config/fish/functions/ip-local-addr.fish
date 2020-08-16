function ip-local-addr
  ip address show enp9s0 | awk '/inet\s/ { print $2 }'
end

