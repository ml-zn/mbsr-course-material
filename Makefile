BUILD = build
SUBDIRS = kursleiter orientierung teilnehmer

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

init:
	mkdir -p $(BUILD)

$(SUBDIRS): init
	$(MAKE) -C $@ clean all
	cp -a $@/$(BUILD)/* $(BUILD)/


