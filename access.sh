#!/bin/bash
# Script untuk mengkonfigurasi VPS
#Mod by MrPinguiiin

# Download dan ganti config SSH
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/MrPinguiiin/rootaccess/main/sshd_config

# Restart service SSH
systemctl daemon-reload
systemctl restart sshd
sleep 5  # Memberi waktu untuk service restart

# Bersihkan layar
clear

# Meminta input password baru
echo -e "Masukkan Password VPS:";
read -e pwe;

# Set password untuk root
usermod -p `perl -e "print crypt(\"$pwe\",\"Q4\")"` root;

# Tampilkan informasi akun
clear;
echo "Mohon Simpan Informasi Akun VPS Ini";
echo "============================================";
echo "Akun Root (Akun Utama)";
echo "Ip address = $(curl -Ls http://ipinfo.io/ip)";
echo "Username   = root";
echo "Password   = $pwe";
echo "============================================";
echo "";

exit 0;
