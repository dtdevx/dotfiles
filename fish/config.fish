if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Make neovim the default editor
set -gx EDITOR nvim

# NVM
## Default nvm dir
## set -gx NVM_DIR $HOME/.nvm
## Set global packages to be installed on new node version installations
set -gx nvm_default_packages @nestjs/cli @angular/cli

fish_config theme choose "Catppuccin Mocha"

# Hydro config
set --global hydro_color_prompt 94e2d5
set --global hydro_color_pwd a6adc8
set --global hydro_color_git 89b4fa

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; # GNU `ls`
  set colorflag "--color"
	set -Ux LS_COLORS 'no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	set colorflag "-G"
	set -Ux LSCOLORS 'BxBxhxDxfxhxhxhxhxcxcx'
end

# Functions / aliases

function l
  ls -lh $colorflag $argv
end

function ll
  ls -lha $colorflag $argv
end

function lg
  lazygit $argv
end

function cl
  clear
end

function cls
  clear
end

function cat
  bat $argv
end

function h
  cd ~ $argv
end

function p
  cd ~/Projects $argv
end

function nv
  nvim $argv
end

function path
  echo "$PATH" | tr ':' '\n' 
end

function now
  date "+KW%V %d.%m.%Y %H:%M:%S"
end

# Kubernetes
# use '--wraps' to keep tab-completion working
function k --wraps kubectl
  kubectl $argv
end


# Git shortcuts

function gs
  git status -uall $argv
end

function gd
  git diff $argv
end

function gb
  # without arguments, just list all branches
  if test (count $argv) -eq 0
    git branch
  else
    set branch_name $argv[1]

    # checkout branch, if it exists
    if git show-ref --verify --quiet refs/heads/$branch_name
      git checkout $branch_name
    else
      # else create branch first, then check it out
      echo "Branch '$branch_name' does not exist. Creating it."
      git checkout -b $branch_name
    end
  end
end

function gc
  if test (count $argv) -eq 0
    GIT_EDITOR=nvim git commit
  else
    git commit -m $argv
  end
end

# Dotfiles

function reload-df
  ~/Projects/dotfiles/utils/create_symlinks.sh
end

# Laravel

function pa
  php artisan $argv
end

starship init fish | source

