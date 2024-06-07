all:
	cd packages && stow --adopt --verbose --target=$$HOME --restow *

delete:
	cd packages && stow --verbose --target=$$HOME --delete *
