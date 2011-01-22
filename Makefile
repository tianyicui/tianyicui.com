ASCIIDOC=asciidoc
SED=sed

%.html: %.txt
	$(ASCIIDOC) $<
	$(SED) -i '' -e 's@</body>@<script type="text/javascript">try{var pageTracker = _gat._getTracker("UA-8949203-5");pageTracker._trackPageview();} catch(err) {}</script></body>@' $@

ALL: index.html resume.html

upload:
	git push -f git@github.com:tianyicui/tianyicui.com.git master
	ssh tianyicui@tianyicui.com "cd ~/tianyicui.com-github && git fetch git://github.com/tianyicui/tianyicui.com.git master && git reset --hard `git rev-parse master`"
