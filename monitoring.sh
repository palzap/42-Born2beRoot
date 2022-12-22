#!/bin/bash
wall “Monitoring log

    *Architecture: $(uname -a)
    *Physical processors: $(grep “physical id” /proc/cpuinfo | uniq | wc -l)
    *Virtual processors: $(grep “processor” /proc/cpuinfo | wc -l)
    *Ram usage: $(free –mega | grep “Mem” | awk ‘{printf(“%i/%i MB (%.2f%%)\n”, $3, $2, ($3/$2*100))}’)
    *Disk usage: $(df -BG –total | grep “total” | awk ‘{printf(“%.1f/%.1f GB (%.2f%%)\n”, $3, $2, ($3/$2*100))}’)
    *CPU usage: $(top -ibn1 | grep “%Cpu” | tr ‘,’ ‘ ‘ |awk ‘{printf(“%.2f%%\n”, (100 – $8)}’)
    *Last boot: $(who –boot | awk ‘{print $3, $4}’)
    *LVM: $(if [ $(lsblk | grep “lvm” | wc -l) -eq 0 ]; then echo “no”; else echo “yes”; fi)
    *Active connections: $(ss -s | grep “TCP:” | awk ‘{print $4}’ | tr -d ,)
    *Users connected: $(who –count | grep “users” | awk ‘{print $2}’ | tr -d “users=”)
    *Network: IP: $(hostname -I) | MAC: $(ip link | grep “ether” | awk ‘{print $2}’ | head -1
    *Sudo commands: $(grep “COMMAND” /var/log/sudo/logfile | wc -l)”
