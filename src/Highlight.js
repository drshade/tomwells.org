"use strict";

export const applyHighlighting = unit => () => {
	// console.log(hljs.listLanguages())
	hljs.highlightAll();
	return unit;
};