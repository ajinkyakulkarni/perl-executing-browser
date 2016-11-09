

function pebFindContextMenu() {
	if (typeof pebContextMenu == 'function') {
		var returnValue = pebContextMenu();
		return returnValue;
	}
}


function pebFindMessageBoxElements() {
	if (typeof pebMessageBoxElements == 'function') {
		var returnValue = pebMessageBoxElements();
		return returnValue;
	}
}

function pebCheckUserInputBeforeClose() {
	var textEntered = false;

	var textFields = new Array();
	textFields = document.getElementsByTagName("textarea");

	for (i = 0; i < textFields.length; i++) { 
		if (textFields[i].value.length > 0) {
			textEntered = true;
		}
	}

	var inputBoxes = new Array();
	inputBoxes = document.querySelectorAll("input[type=text]");

	for (i = 0; i < inputBoxes.length; i++) { 
		if (inputBoxes[i].value.length > 0) {
			textEntered = true;
		}
	}

	return textEntered;
}


function pebCheckCloseWarning() {
	var closeWarning;

	if (typeof pebCloseConfirmationAsync == 'function') {
		closeWarning = "async";
	} else {
		if (typeof pebCloseConfirmationSync == 'function') {
			closeWarning = "sync";
		} else {
			closeWarning = "none";
		}
	}

	return closeWarning;
}


function pebInodeSelection(target, inodes) {
	if (typeof window[target] == 'function') {
		var inodesTransmitted = inodes;
		window[target](inodesTransmitted);
	} else {
		var element = document.getElementById(target);
		element.innerHTML = inodes;
	}
}


function pebOutputInsertion(target, output) {
	if (typeof window[target] == 'function') {
		window[target](output);
	} else {
		var element = document.getElementById(target);
		element.innerHTML = output;
	}
}
