# This script checks for and removes previous installs of macports and rvm

# http://stackoverflow.com/questions/5735666/execute-bash-script-from-url
# This is meant to be run by pasting the following into Terminal
# bash <(curl -s https://gist.github.com/phlco/8358292/raw/48f61796b20f879cdfa30250614ac40ec2a76d43/uninstalls.sh)
# This script checks for and removes previous installs of macports or rvm

# http://stackoverflow.com/questions/3976362/bash-scripts-requiring-sudo-password
# Run the Script with sudo
echo $user_pass | sudo -vS

# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
# Uninstall if the command exists

# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
# Uninstall RVM

if hash rvm 2>/dev/null; then
  rvm implode
  rm -rf ~/.rvm
  echo "RVM has been destroyed. You are welcome, $(user_name)."
else
  echo "RVM is not installed. Moving on..."
fi

# http://guide.macports.org/chunked/installing.macports.uninstalling.html
# Uninstall Macports

if hash port 2>/dev/null; then
  echo "$(user_name), you installed Macports?"
  sudo port -fp uninstall installed
  sudo rm -rf \
    /opt/local \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/org.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0 \
    ~/.macports
    # carthago delenda est
    sudo find / | grep macports | sudo xargs rm
    echo "Macports has been removed."
else
  echo "Macports is not installed. Moving on..."
fi
