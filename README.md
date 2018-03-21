# SSH Agent Setup

Small utility script to help you setup ssh-agent process persistence.
Thanks to Wayne Walker for his awesome work!


## How to use

```bash
# Download helper script
wget https://raw.githubusercontent.com/victorboissiere/ssh-agent-setup/master/setup.sh
# Add right permissions
chmod +x setup.sh
# Run setup
./setup.sh
# Delete script
rm setup.sh
```

This will basically add to your `.zshrc` and `.bashrc` files the following:

```bash
. .ssh/ssh-find-agent.sh
ssh-find-agent -a || eval $(ssh-agent) > /dev/null
```

You can learn more on wwalker [project](https://github.com/wwalker/ssh-find-agent).

