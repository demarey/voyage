private persistence
update: anObject serialized: jsonDictionary withId: aOID
	self writingPool withDatabase: [ :db |
		(self collectionAt: anObject class inDatabase: db) 
			replace: {'_id'->aOID} asDictionary
			with: (jsonDictionary
				at: '_id' put: aOID;
				yourself).

		mongoUrlResolver checkLastError: db.
	].

	^aOID