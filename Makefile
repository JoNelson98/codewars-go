# Usage:
# make r KATA=544675c6f971f7399a000e79  # to train
# make t                                # to test
# make a                                # to attempt
# make s                                # to submit

# load environment variables from .env file
-include .env
CLI := CW_SESSION_ID=$(CW_SESSION_ID) CW_REMEMBER_USER_TOKEN=$(CW_REMEMBER_USER_TOKEN) codewars-cli
LANG := go

# Shortcuts: t = test, a = attempt, s = submit, r = train
KATA_DIR ?= .
t:
	cd $(KATA_DIR) && $(CLI) test

a:
	cd $(KATA_DIR) && $(CLI) attempt

s:
	@echo "📤 Submitting $(KATA_DIR)..."
	cd $(KATA_DIR) && $(CLI) submit
	@if [ $$? -eq 0 ]; then \
		echo "🎉 Submission successful! Committing to Git..."; \
		git add $(KATA_DIR)/; \
		git commit -m "Completed $(KATA_DIR) in Go! 🚀"; \
		git push origin main; \
		echo "✅ Pushed to GitHub!"; \
	else \
		echo "❌ Submission failed. Not committing."; \
		exit 1; \
	fi


r:
ifndef KATA
	$(error Please provide KATA=<kata-id>, e.g., make r KATA=544675c6f971f7399a000e79)
endif
	$(CLI) train --language $(LANG) $(KATA)