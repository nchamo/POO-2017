!classDefinition: #TusLibrosTest category: #'TusLibros-Solution'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'newCart aBook anotherBook cartWithEmptyCatalogue newCartWithFullCatalogue aCashier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/15/2017 20:12:14'!
test001CantCreateCartWithEmptyCatalogue

	self
		should: [ Cart newWithCatalogue: {} ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText equals: Cart emptyCatalogueErrorDescription ]! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/17/2017 15:26:39'!
test006CantAddZeroOfABook

	self
		should: [ newCart add: aBook times: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText = Cart notPositiveAddErrorDescription]! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/13/2017 19:50:56'!
test01EmptyCartIsEmpty

	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/13/2017 20:01:00'!
test02CartContainsBookAfterAddingIt
	
	newCart add: aBook.

	self assert: (newCart includes: aBook)! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/15/2017 17:08:26'!
test03CountsTwoAfterAddingItTwice
	
	newCart add: aBook times: 2.

	self assert: (newCart amountOf: aBook) equals: 2! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/17/2017 15:38:38'!
test04CantAddANegativeAmountOfABook
	
	self
		should: [ newCart add: aBook times: -1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText equals: Cart notPositiveAddErrorDescription ]! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/15/2017 16:54:26'!
test05CantAddANonIntegerAmountOfABook
	
	self
		should: [ newCart add: aBook times: 1.05 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText = Cart nonIntegerAddErrorDescription]! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/15/2017 20:19:55'!
test06CartRespondsRightForItsContents

	newCartWithFullCatalogue add: aBook; add: anotherBook.
	
	self assert: newCartWithFullCatalogue contents equals: { aBook. anotherBook } asBag! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/15/2017 19:19:05'!
test07CartCantBeModifiedByChangingItsContents
	
	newCart contents add: aBook.
	
	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: '1 - cart' stamp: 'PV 6/17/2017 14:44:04'!
test08CantAddToCartProductsThatDontBelongToTheCatalogue

	self
		should: [ newCart add: anotherBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error | self assert: error messageText equals: Cart notInCatalogueErrorDescription]! !


!TusLibrosTest methodsFor: 'setUp' stamp: 'PV 6/17/2017 20:41:35'!
setUp

	aBook := Object new.
	anotherBook := Object new.

	newCart := Cart newWithCatalogue: { aBook }.
	newCartWithFullCatalogue := Cart newWithCatalogue: { aBook. anotherBook }.
	
	aCashier := Cashier new

	! !


!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 20:40:02'!
test11CantCheckoutIfCartIsEmpty

	self
		should: [ aCashier checkout: newCart ]
		raise: Error - MessageNotUnderstood
		withExceptionDo:
			[ :error | self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription]! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'products catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/15/2017 16:39:30'!
add: aProduct

	self add: aProduct times: 1! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 15:35:50'!
add: aProduct times: aNumber

	(aNumber negative or: [ aNumber isZero ]) ifTrue: [ self error: self class notPositiveAddErrorDescription ].
	aNumber isInteger ifFalse: [ self error: self class nonIntegerAddErrorDescription ].

	(catalogue includes: aProduct) ifFalse: [ self error: self class notInCatalogueErrorDescription ].
	
	products add: aProduct withOccurrences: aNumber! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 20:06:04'!
amountOf: aProduct

	^ products occurrencesOf: aProduct! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/15/2017 19:18:04'!
contents

	^ products copy! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:53:27'!
includes: aProduct 
	
	^ products includes: aProduct! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/15/2017 17:56:03'!
initializeWithCatalogue: aCatalogue

	catalogue := aCatalogue.
	products := Bag new! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PV 6/13/2017 19:51:52'!
isEmpty

	^ products isEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/15/2017 19:56:14'!
emptyCatalogueErrorDescription

	^ 'Can''t create a cart with an empty catalogue'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 14:46:27'!
newWithCatalogue: aCatalogue

	aCatalogue isEmpty ifTrue: [ self error: self emptyCatalogueErrorDescription ].

	^ self new initializeWithCatalogue: aCatalogue! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 20:45:03'!
nonIntegerAddErrorDescription

	^ 'Can''t add product to cart a non-integer number of times'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/15/2017 17:50:28'!
notInCatalogueErrorDescription

	^ 'Can''t add to cart a product that doesn''t belong to the catalogue'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 20:45:12'!
notPositiveAddErrorDescription

		^ 'Can''t add to cart a product a not positive number of times'! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 20:54:36'!
checkout: aCart

	^ self error: self class emptyCartCheckoutErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'PV 6/17/2017 20:44:33'!
emptyCartCheckoutErrorDescription

	^ 'Can''t checkout if cart is empty'! !
