$env.EDITOR = "nvim"

$env.config.shell_integration.osc9_9 = false
$env.config.shell_integration.osc133 = false

$env.config.keybindings ++= [
	{
		name: fzf_fuzzy_search
		modifier: control
		keycode: char_t
		mode: [emacs vi_normal vi_insert]
		event: {
			send: executehostcommand
			cmd: "fzf | commandline edit --insert $in"
		}
	}
]

alias lg = lazygit
alias tree = lsd --tree --ignore-glob="bin" --ignore-glob="obj"
alias zipup = 7z a (pwd | path basename | $in + ".7z") . -r -xr!bin -xr!obj -xr!.git

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

source ~/.zoxide.nu
source ~/.cache/carapace/init.nu

alias cd = z
alias dotfiles = z (chezmoi source-path)
alias deps = python c:/Users/adam.miller/Documents/Projects/py_scripts/project_dependency.py
