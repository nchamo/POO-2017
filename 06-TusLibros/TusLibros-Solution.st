!classDefinition: #TusLibrosTest category: #'TusLibros-Solution'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'newCart aBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:48:45'!
setUp
	
	newCart := Cart newEmpty.
	aBook := Object new.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:50:56'!
test01EmptyCartIsEmpty

	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:01:00'!
test02CartContainsBookAfterAddingIt
	
	newCart add: aBook.

	self assert: (newCart includes: aBook)! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:07:33'!
test03CountsTwoAfterAddingItTwice
	
	newCart add: aBook times: 2.

	self assert: (newCart amountOf: aBook) equals: 2.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:40:02'!
test04CantAddANegativeAmountOfABook
	
	self
		should: [ newCart add: aBook times: -1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText = Cart negativeAddErrorDescription ]! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'products'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:00:34'!
add: aProduct

	products add: aProduct! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:08:31'!
add: aProduct times: aNumber

	aNumber negative ifTrue: [ self error: self class negativeAddErrorDescription ].
	
	products add: aProduct withOccurrences: aNumber! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:06:04'!
amountOf: aProduct

	^ products occurrencesOf: aProduct! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:53:27'!
includes: aProduct 
	
	^ products includes: aProduct! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:44:22'!
initializeEmpty

	products := Bag new! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:51:52'!
isEmpty

	^ products isEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:36:16'!
negativeAddErrorDescription

	^ 'Can''t add a product a negative number of times.'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:49:00'!
newEmpty

	^ self new initializeEmpty! !
