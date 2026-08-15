# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Machine-local secrets

`~/.zshrc` optionally loads `~/.zshrc.local`. The latter is intentionally not
managed by chezmoi, so API keys and other machine-specific environment
variables are never stored in this repository.

On a new machine, after applying the dotfiles, create the file with restrictive
permissions and add the required values:

```sh
chmod 600 ~/.zshrc.local
nvim ~/.zshrc.local
```

For example:

```zsh
export DEEPSEEK_API_KEY="replace-with-a-new-key"
```

Do not run `chezmoi add ~/.zshrc.local` and do not commit this file.
