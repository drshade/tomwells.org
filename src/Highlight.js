"use strict";

exports.applyHighlighting = unit => () => {
	console.log("Running highlights")
	hljs.highlightAll();
	return unit;
};