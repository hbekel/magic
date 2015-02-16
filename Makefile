PREFIX=/usr
DESTDIR=

all: magic

install:
	install -D -m644 magic $(DESTDIR)$(PREFIX)/lib/magic/magic

uninstall:
	rm -r ${PREFIX}/lib/magic/

