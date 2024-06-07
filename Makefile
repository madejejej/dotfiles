all:
	cd packages && stow --verbose --target=$$HOME --restow *

delete:
	cd packages && stow --verbose --target=$$HOME --delete *
