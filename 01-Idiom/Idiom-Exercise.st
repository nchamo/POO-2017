!classDefinition: #NotFound category: #'Idiom-Exercise'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #IdiomTest category: #'Idiom-Exercise'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!IdiomTest methodsFor: 'testing' stamp: 'NC 4/20/2017 21:30:11'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self assert: [ CustomerBook createWithCustomerNamed: 'John Lennon' ]
		  takesLessThan: (Duration milliSeconds: 50).	

	
! !

!IdiomTest methodsFor: 'testing' stamp: 'NC 4/20/2017 21:29:55'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	paulMcCartney := 'Paul McCartney'.	
	
	customerBook := CustomerBook createWithCustomerNamed: paulMcCartney.
	 
	self assert: [ customerBook removeCustomerNamed: paulMcCartney ] 
		  takesLessThan: (Duration milliSeconds: 100).	
! !

!IdiomTest methodsFor: 'testing' stamp: 'NC 4/20/2017 21:30:41'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assert: [ customerBook addCustomerNamed: '' ]
		  failsWithException: Error 
		  andConditionsAreMet: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'NC 4/20/2017 21:30:47'!
test04CanNotRemoveAndInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createWithCustomerNamed: johnLennon.
	
	self assert: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
		failsWithException: NotFound 
		andConditionsAreMet: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!IdiomTest methodsFor: 'assertions' stamp: 'NC 4/20/2017 21:42:32'!
assert: aBlock failsWithException: anException andConditionsAreMet: aBlockOfConditions

	"Assert that the given block of code fails with an exceptions, and that then all assertions in the block of conditions are met"
	
	[ aBlock value. self fail ]
		on: anException 
		do: aBlockOfConditions
	! !

!IdiomTest methodsFor: 'assertions' stamp: 'NC 4/20/2017 21:42:39'!
assert: aBlock takesLessThan: aDuration
	
	|  millisecondsBeforeRunning millisecondsAfterRunning  |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aDuration totalMilliSeconds 
! !


!classDefinition: #CustomerBook category: #'Idiom-Exercise'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'Idiom-Exercise'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !


!CustomerBook class methodsFor: 'creation' stamp: 'NC 4/20/2017 20:56:04'!
createWithCustomerNamed: aName
	"Create a Customer Book with a name"

	| aNewCustomerBook |
	
	aNewCustomerBook := self new.
	aNewCustomerBook addCustomerNamed: aName.
	^ aNewCustomerBook.! !
