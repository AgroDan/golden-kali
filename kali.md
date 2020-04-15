## To install Kali and make it useful, install the following from apt:

- terminator
- jxplorer
- seclists
- gobuster
- python3-pip
- crackmapexec
- neo4j (for bloodhound)
- openjdk-14-jdk (for things that are still made in Java for some reason like Ghidra)
- rlwrap
- eog
- xclip
- exif
- steghide

## From github:
- JumboJohn: https://github.com/magnumripper/JohnTheRipper
- Nishang: https://github.com/samratashok/nishang
- Chisel: https://github.com/jpillora/chisel
- LinEnum: https://github.com/rebootuser/LinEnum
- PEASS: https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite
- PowerSploit: https://github.com/PowerShellMafia/PowerSploit
  - (then switch to Dev branch) git checkout dev
- Impacket: https://github.com/SecureAuthCorp/impacket
  - Impacket scripts come with Kali, but git repo is more recent. Use the setup.py to build and install before using. Then use python3 to execute!
- Bloodhound: https://github.com/BloodHoundAD/BloodHound
  - start up neo4j: neo4j console
  - Visit the resulting localhost port
  - Create a password for the neo4j user

## Misc
- FoxyProxy for firefox
- Ghidra: https://ghidra-sre.org/
- Evil-WinRM, install from gem: gem install evil-winrm
- Remove stupid mouse bindings in vim. Edit /etc/vim/vimrc and add:
  - set mouse=
  - set ttymouse=
