initialization
initializeWidgets
	remoteUrlLabel := self newLabel label: 'Remote URL'.
	remoteUrl := self newTextInput text: 'git@github.com:'; autoAccept: true.
	
	localDirectoryLabel := self newLabel label: 'Local directory:'.
	localDirectory := self newLabel label: 'default location (iceberg-cache)'.
	changeLocationButton := self newButton label: 'Change'.
	
	subdirectoryLabel := self newLabel label: 'Code subdirectory'.
	subdirectory := self newTextInput autoAccept: true.
	
	createButton := self newButton
		label: 'Create repository';
		yourself.
	
	self focusOrder 
		add: remoteUrl;
		add: changeLocationButton;
		add: subdirectory;
		add: createButton