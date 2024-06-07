# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Path to your oh-my-zsh installation.
export ZSH="/Users/kacper/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# User configuration

export LANG=en_US.UTF-8
export LC_NUMERIC="en_us"
export LC_TIME="en_us"
export LC_COLLATE="en_us"
export LC_MONETARY="en_us"
export LC_MESSAGES="en_us"

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(github z git ruby macos)

. /opt/homebrew/opt/asdf/libexec/asdf.sh
. ~/.oh-my-zsh/plugins/z/z.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# GIT ALIASES
alias git=hub
alias g=git
alias ga="git add"
alias gs="git status"
alias gci="git commit"
alias gp="git push -u"
alias gpure="git pull --rebase"
alias gdc="git diff --cached"
alias gdi="git diff"
alias gco="git checkout"
alias gm='gco `git branch -rl "*/HEAD" | cut -d/ -f3`'
alias gg="git grep -n"
alias pr='git pull-request --draft --browse -a madejejej -b `git branch -rl "*/HEAD" | cut -d/ -f3`'

# RUBY ALIASES
alias be="bundle exec"
alias ra="bin/rails"

function rsp() {
  if [ -e bin/rspec ]; then
    bin/rspec $@
  else
    be rspec $@
  fi
}

function cuc() {
  if [ -e bin/cucumber ]; then
    bin/cucumber --publish-quiet $@
  else
    be cucumber --publish-quiet $@
  fi
}

# So that we can use Spring and ObjC won't complain
# https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes

# MISC
alias cat="bat"
alias vl="vim ~/daily.log"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/Library/Python/3.11/bin:$PATH"
eval "$(rbenv init -)"

autoload -U compinit && compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source "$HOME/.castle"

export GITHUB_TOKEN="$(op read op://Personal/github_token/password --account my.1password.com)"
export BUNDLE_GITHUB__COM="x-access-token:$GITHUB_TOKEN"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# added by Snowflake SnowSQL installer v1.2
export PATH=/Users/kacper/Applications/SnowSQL.app/Contents/MacOS:$PATH


ulimit -n 10240
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/usr/local/sbin:$PATH"
#export PATH='/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/sbin:/usr/local/opt/python@3.8/bin:/Users/kacper/Applications/SnowSQL.app/Contents/MacOS:/Users/kacper/.cargo/bin:/Users/kacper/.yarn/bin:/Users/kacper/.config/yarn/global/node_modules/.bin:/Users/kacper/.luarocks/bin:/Users/kacper/google-cloud-sdk/bin:/Users/kacper/.nodenv/shims:/Users/kacper/esp/xtensa-esp32-elf/bin:/Users/kacper/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/usr/local/munki:/Applications/Wireshark.app/Contents/MacOS'"

# NVM
NVM_DIR="$HOME/.nvm"
export NVM_DIR
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
export GPG_TTY=$(tty)

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

export PATH="/Users/kacper/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
