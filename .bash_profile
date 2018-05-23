# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

alias git=hub
alias skellyio='ssh ubuntu@skelly.io -i ~/.ssh/skellyio.pem'
# export PATH=$PATH:~/.rbenv/shims
export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# export VIRTUALENVWRAPPER_PYTHON=`which python`
# export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
# source `which virtualenvwrapper.sh`  #FIX THIS AT SOME POINT
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="~/.scala:$PATH";

export PATH="~/dotfiles:$PATH";

alias subeach='git submodule foreach'
alias dm='docker-machine start vm; eval $(docker-machine env vm); echo "Docker Ready"'
# dm &
alias dc='docker-compose'

export LIFX_TOKEN=ccfd03224a0ad63ed6f8c487c1eff9bedeba04ebb8405dac527ecc1d5d7c6183

alias lights="python /Coding/python/lifx/lights.py"
alias mood="lights mood"
alias up="lights up"
alias down="lights down"

alias eextra="nano ~/.extra"
alias extra="source ~/.extra"

export GOPATH=/Users/michaelskelly/Cloud/Coding/go

# Set my termnal colours
alias black='echo -e "\033]50;SetProfile=black\a"'
alias yellow='echo -e "\033]50;SetProfile=yellow\a"'
alias red='echo -e "\033]50;SetProfile=red\a"'
alias green='echo -e "\033]50;SetProfile=green\a"'
alias blue='echo -e "\033]50;SetProfile=blue\a"'
alias purple='echo -e "\033]50;SetProfile=purple\a"'


# Full Fact commands
alias ff='cd /Coding/fullfact/docker-stack'
alias max='ssh max.fullfact.org'
alias dl='dc logs --tail=10 -f'

# Network Locum
alias nl='cd /Coding/networklocum/stack'

git config --global commit.gpgsign false

# Give homebrew commands precedence
alias ruby='/usr/local/bin/ruby'

# OK I messed up my SSH, fix it here
export PATH="/usr/bin/:$PATH";

alias worktools="ssh -i ~/.ssh/worktools.pem ubuntu@server.worktools.io"

git config --global commit.gpgsign false


# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Apparently for homebrew python
export PATH=/usr/local/share/python:$PATH

