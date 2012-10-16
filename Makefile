PROGRAM=lockdown
PREFIX=${HOME}

gitpush:
	git push -u origin master

install: $(PROGRAM)
	@echo "Installing lockdown..."
	install -m 0755 $(PROGRAM) $(PREFIX)/bin

clean: 
	rm *~
