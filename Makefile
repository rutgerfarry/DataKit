NAME = DataKit
SCHEME = DataKit
SDK = iphonesimulator
DEST = iPad Air

all: build test

build: $(NAME).xcworkspace
	set -o pipefail && xcodebuild \
		-workspace $(NAME).xcworkspace \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		build

build-for-testing: $(NAME).xcworkspace
	set -o pipefail && xcodebuild \
		-workspace $(NAME).xcworkspace \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		build-for-testing

test: build-for-testing
	set -o pipefail && xctool \
		-workspace $(NAME).xcworkspace \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		run-tests

clean:
	set -o pipefail && xcodebuild \
		-workspace $(NAME).xcworkspace \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		clean
