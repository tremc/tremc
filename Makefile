.PHONY: install

install:
	install -d "${DESTDIR}${PREFIX}/share/man/man1"
	install -m 644 tremc.1 "${DESTDIR}${PREFIX}/share/man/man1/tremc.1"
	install -d "${DESTDIR}${PREFIX}/bin"
	install -m 755 tremc "${DESTDIR}${PREFIX}/bin/tremc"
	install -d "${DESTDIR}${PREFIX}/share/bash-completion/completions"
	install -m 644 "completion/bash/tremc.sh" "${DESTDIR}${PREFIX}/share/bash-completion/completions/tremc"
	install -d "${DESTDIR}${PREFIX}/share/zsh/site-functions/"
	install -m 644 "completion/zsh/_tremc" "${DESTDIR}${PREFIX}/share/zsh/site-functions/_tremc"
