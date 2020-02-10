sudo systemctl daemon-reload
sudo systemctl stop dhcpcd.service
sudo ip addr flush dev eth0
sudo systemctl start dhcpcd.service
sudo systemctl restart networking.service
