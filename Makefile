SPLIT_SCRIPTS = \
	wireguard-install-split.sh \
	functions/*.sh \

all: wireguard-install-merged.sh

wireguard-install-merged.sh: $(SPLIT_SCRIPTS)
	merge-shell.sh wireguard-install-split.sh > wireguard-install-merged.sh

test: wireguard-install-merged.sh
	@diff -u wireguard-install.sh wireguard-install-merged.sh
	@echo "Test passed"

clean:
	rm -f wireguard-install-merged.sh
