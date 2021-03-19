"use strict";

exports.applyHighlighting = unit => () => {
	// console.log(hljs.listLanguages())
	hljs.highlightAll();
	return unit;
};