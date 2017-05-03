let s = document.createElement('script');

s.src = chrome.extension.getURL('gCal.js');
s.onload = function() {
	this.remove();
};

(document.head || document.documentElement).appendChild(s);
