#!/usr/bin/make -f

clean:
	rm -drf public
	find . -name "*~" -exec rm {} \;