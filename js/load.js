let s = document.createElement('script');

s.src = chrome.extension.getURL('dist/gCal.min.js');
s.onload = function() {
	this.remove();
};

(document.head || document.documentElement).appendChild(s);
