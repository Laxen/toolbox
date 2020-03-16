set -o vi

alias l="ls -alh"
alias c="cd .."
alias sysrel="systemctl daemon-reload"
alias sysres="systemctl restart"
alias sysstop="systemctl stop"
alias sysstart="systemctl start"
alias sysmask="systemctl mask"
alias sysstat="systemctl status"
alias servicegrep="ls -alh /lib/systemd/system | grep"
alias sua="su -s /bin/sh "
autodd () { echo "Creating \"bigfile\" with size $1 MB..."; dd if=/dev/zero of=bigfile bs=1M count="$1"; }
dynamicdebug () { echo "file $1 +p" > /sys/kernel/debug/dynamic_debug/control; }
alias fixlocale="cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime && echo \"Locale set to Stockholm!\""
alias printall="echo 8 > /proc/sys/kernel/printk"
alias ecp="/root/ecp"
alias crash="echo c > /proc/sysrq-trigger"
alias iosched="cat /sys/block/sda/queue/scheduler"

cpugov () {
    LOC="/sys/devices/system/cpu/cpufreq"
    gov_0=$( cat "$LOC/policy0/scaling_governor" )
    cpus_0=$( cat "$LOC/policy0/affected_cpus" )
    gov_4=$( cat "$LOC/policy4/scaling_governor" )
    cpus_4=$( cat "$LOC/policy4/affected_cpus" )

    echo "$cpus_0: $gov_0"
    echo "$cpus_4: $gov_4"
}

setcpugov () {
    LOC="/sys/devices/system/cpu/cpufreq"
    echo "$1" > "$LOC/policy0/scaling_governor"
    echo "$1" > "$LOC/policy4/scaling_governor"
    cpugov
}

setiosched () {
    echo "$1" > "/sys/block/sda/queue/scheduler"
    iosched
}
