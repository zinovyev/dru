function cmd_update {
  curl -s https://raw.githubusercontent.com/zinovyev/dru/master/dru | sudo sh -c 'cat > /usr/bin/dru && chmod +x /usr/bin/dru'
}
