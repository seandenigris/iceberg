actions
commit: versions withMessage: message
	self withRepoDo: [ :repo | 
		| head parentCommit index treeId signature commitId newCommit |
		head := repo head.
		parentCommit := head object.
		signature := repo defaultSignature.
		
		"versions do: [ :version | index addAll: version directoryName ]"
		index := repo index.
		index addAll.
		treeId := index  writeTreeAndReturnOid.
		
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: treeId);
			message: message;
			parents: { parentCommit };
			updateReference: head;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		newCommit := self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
		^ self frontend branch addCommit: newCommit.
	]