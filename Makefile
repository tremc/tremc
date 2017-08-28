.PHONY: install

install:
	install -d "${DESTDIR}${PREFIX}/share/man/man1"
	install -m 644 tremc.1 "${DESTDIR}${PREFIX}/share/man/man1/tremc.1"
	install -d "${DESTDIR}${PREFIX}/bin"
	install -m 755 tremc "${DESTDIR}${PREFIX}/bin/tremc"
	install -d "${DESTDIR}${PREFIX}/share/bash-completion/completions"
	install -m 755 "completion/bash/transmission-remote-cli-bash-completion.sh" "${DESTDIR}${PREFIX}/share/bash-completion/completions/tremc"
