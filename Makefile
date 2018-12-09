BUILD = build
SUBDIRS = kursleiter orientierung teilnehmer

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS): 
	$(MAKE) -C $@ clean all
	cp -a $@/$(BUILD)/* $(BUILD)/


