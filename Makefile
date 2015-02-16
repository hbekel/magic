PREFIX=/usr
DESTDIR=

all: magic

install:
	install -D -m644 magic $(DESTDIR)$(PREFIX)/share/magic/magic

uninstall:
	rm ${PREFIX}/share/magic/magic

