// 課題 JS-3 の実装をここに記述してください。
(function (document, undefined) {
	'use strict';

	var submitButtom = document.getElementById ("submit-button");
	var logInput = document.getElementById ("log-input");
	var tableContainer = document.getElementById ("table-container");
	submitButtom.addEventListener ("click", function () {
		createLogTable (tableContainer, parseLTSVLog (logInput.value));
	});
	console.log (logInput);
})(document, undefined);
