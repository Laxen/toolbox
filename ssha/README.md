# ssha

This script creates a profile on the target, sources it when you log in and
removes it afterwards. All in one ssh command! This allows you to have all your
favorite aliases and functions everytime you ssh to a device.

## Usage
ssha [user@]<ip> [pass]

"ip" can be IPv4, IPv6 or hostname. It can also be only the last digit(s) of an
IPv4 address and will then use the subnet from the config file (see below).

## Config file
When first running ssha it will create a .ssha folder in your home directory
containing a config file with default values. You can change these values to
your liking. Here's a short explanation of each option:

target_shell:
The shell that will be started on the target when sshing (default: /bin/sh)

target_user:
The user when no user is specified (default: root)

target_subnet:
The subnet when inputting a short IPv4 address (see above) (default: 192.168.1)

profiles_dropdir:
A dropdir with all profiles that should be sourced at login (default:
$HOME/.ssha/profiles.d)

bypass_known_hosts_file:
Set to "y" to bypass known hosts file (default is "n"), THIS IS NOT SAFE UNLESS
YOU KNOW WHAT YOU'RE DOING

bypass_strict_host_key_checking:
Set to "y" to bypass strict host key checking (default is "n"), THIS IS NOT
SAFE UNLESS YOU KNOW WHAT YOU'RE DOING
