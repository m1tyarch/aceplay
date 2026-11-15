PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

all:
	@echo "Nothing to compile. Run 'make install' or 'make uninstall'."

install:
	install -Dm755 aceplay $(DESTDIR)$(BINDIR)/aceplay

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/aceplay

lint:
	shellcheck aceplay
	shfmt -d aceplay

format:
	shfmt -w aceplay

.PHONY: all install uninstall lint format
