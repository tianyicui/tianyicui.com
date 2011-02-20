ASCIIDOC=asciidoc
SED=sed

%.html: %.txt
	$(ASCIIDOC) $<
	$(SED) -i '' -f GoogleAnalytics.sed $@

ALL: index.html resume.html cpia.html reading.html

upload:
	git push -f git@github.com:tianyicui/tianyicui.com.git master
	ssh tianyicui@tianyicui.com "cd ~/tianyicui.com-github && git fetch git://github.com/tianyicui/tianyicui.com.git master && git reset --hard `git rev-parse master`"
