#
# Copyright (c) 2013, Joyent, Inc. All rights reserved.
#
# Makefile: top-level Makefile
#
# This Makefile contains only repo-specific logic and uses included makefiles
# to supply common targets (javascriptlint, jsstyle, restdown, etc.), which are
# used by other repos as well.
#

#
# Tools
#
NPM		 = npm

#
# Files
#
JS_FILES	:= $(shell find examples lib tests -name '*.js')
JSON_FILES	 = package.json
JSL_FILES_NODE   = $(JS_FILES)
JSSTYLE_FILES	 = $(JS_FILES)
JSL_CONF_NODE	 = jsl.node.conf

.PHONY: all
all:
	$(NPM) install
CLEAN_FILES += node_modules

.PHONY: test
test: all
	@node tests/tst.basic.js
	@node tests/tst.bucketize_linear.js
	@node tests/tst.bucketize_loglinear.js
	@node tests/tst.bucketize_p2.js
	@node tests/tst.nonnumeric.js
	@echo all tests passed

include ./Makefile.targ
