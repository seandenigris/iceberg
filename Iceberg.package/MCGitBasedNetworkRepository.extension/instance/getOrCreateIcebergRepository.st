*Iceberg-Adapters
getOrCreateIcebergRepository
	| remoteUrl remote |

	remoteUrl := self perform: Iceberg remoteTypeSelector.
	remote := IceGitRemote url: remoteUrl.
	^ IceRepository registry 
		detect: [ :repo | repo origin referencesSameRemoteLocationAs: remote ]
		ifNone: [ self createIcebergRepositoryFor: remoteUrl ]