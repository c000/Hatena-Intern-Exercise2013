'use strict';

// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
var parseLTSVLog = function (logString) {
	var logsRaw = logString.split ('\n');
	var length = logsRaw.length;
	var logs = [];
	for (var i = 0; i < length; ++i) {
		if (logsRaw[i] != "") {
			var log = {};
			var logRaw = logsRaw[i].split ('\t');
			var logRawLength = logRaw.length;
			for (var j = 0; j < logRawLength; ++j) {
				var splitPosition = logRaw[j].search ('\:');
				var key = logRaw[j].substring (0, splitPosition);
				var val = logRaw[j].substring (splitPosition + 1);
				if (key == "reqtime_microsec") {
					log[key] = parseInt (val);
				} else {
					log[key] = val;
				}
			}
			logs.push (log);
		}
	}
	return logs;
};

// 課題 JS-2: 関数 `createLogTable` を記述してください
var createLogTable = function (divDOM, logs) {
	var table = document.createElement ("table");

	var thead = document.createElement ("thead");
	thead.appendChild ((function () {
		var tr = document.createElement ("tr");
		var th = document.createElement ("th");
		th.textContent = "path";
		tr.appendChild (th);
		var th = document.createElement ("th");
		th.textContent = "reqtime_microsec";
		tr.appendChild (th);
		return tr;
	})());

	var tbody = document.createElement ("tbody");
	var rowLength = logs.length;
	for (var i = 0; i < rowLength; ++i) {
		var row = logs[i];
		tbody.appendChild ((function () {
			var tr = document.createElement ("tr");
			var keys = thead.firstChild.childNodes;
			var keyLength = keys.length;
			for (var k = 0; k < keyLength; ++k) {
				var key = keys[k].textContent;
				tr.appendChild ((function () {
					var td = document.createElement ("td");
					td.textContent = row[key];
					return td;
				})());
			}
			console.log (tr);
			return tr;
		})());
	}

	table.appendChild (thead);
	table.appendChild (tbody);
	divDOM.appendChild (table);
};
