ASCIIDOC=asciidoc

%.html: %.txt
	$(ASCIIDOC) $<

ALL: index.html resume.html

upload:
	git push -f git@github.com:tianyicui/tianyicui.com.git master
	ssh tianyicui@tianyicui.com "cd ~/tianyicui.com-github && git fetch git://github.com/tianyicui/tianyicui.com.git master && git reset --hard `git rev-parse master`"
