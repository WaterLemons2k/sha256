NAME := sha256
# GoReleaser removes the `dist` directory before running, so
# put the binaries elsewhere.
PREFIX := output

BUILD_TARGETS ?= darwin_amd64 windows_386 windows_amd64 linux_386 linux_amd64 linux_arm linux_arm64
.PHONY: all clean $(BUILD_TARGETS)

all: clean build
clean:
	rm -rf $(PREFIX)
build: $(BUILD_TARGETS)

ENV = GOOS=$(GOOS) GOARCH=$(word 2, $(parts))
FLAGS = -ldflags "-s -w"

define generate_build
$(1): sha256.go
	$(eval parts := $(subst _, , $1))
	$(eval GOOS := $(word 1, $(parts)))
	$(eval ifeq ($(GOOS),windows)
		EXT := .exe
	else
		EXT :=
	endif)

	$(ENV) go build $(FLAGS) -o $(PREFIX)/$1/$(NAME)$(EXT) $<

	cd $(PREFIX)/$1 && \
	if [ -z $(EXT) ]; then \
		tar czf ../$(NAME)_$1.tar.gz *; \
	else \
		zip -q ../$(NAME)_$1.zip *; \
	fi
endef

$(foreach target, $(BUILD_TARGETS), $(eval $(call generate_build,$(target))))
