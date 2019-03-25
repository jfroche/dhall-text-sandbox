.DEFAULT_GOAL:=help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

nix-pin: ## Pin nix
	nix-prefetch-git https://github.com/nixos/nixpkgs-channels.git refs/heads/nixos-unstable > .nixpkgs-version.json

lint:  ## Lint code using pre-commit
	pre-commit run --all
