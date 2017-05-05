!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topItem size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'NC 5/4/2017 22:03:36'!
initializeWith: aState
	"Set the top item of the stack"

	topItem := aState.
	size := 0! !


!OOStack methodsFor: 'stackOperations' stamp: 'NC 5/4/2017 22:01:14'!
isEmpty
	"Return whether the stack is empty or not"

	^ topItem hasValue not! !

!OOStack methodsFor: 'stackOperations' stamp: 'NC 5/4/2017 22:08:54'!
pop
	"Return the top value, and discard it"
	
	| newTopItem topValue |
	
	topValue := topItem itemValue.
	newTopItem := topItem previousItem.
	topItem := newTopItem.
	size := size - 1.
	^ topValue.! !

!OOStack methodsFor: 'stackOperations' stamp: 'NC 5/4/2017 22:04:03'!
push: aValue
	"Push a value to the stack"

	| newItem |

	newItem := ValuedItem createWithValue: aValue andItem: topItem.
	topItem := newItem.
	size := size + 1.	! !

!OOStack methodsFor: 'stackOperations' stamp: 'NC 5/4/2017 22:04:35'!
size
	"Return the size of the stack"

	^ size.! !

!OOStack methodsFor: 'stackOperations' stamp: 'NC 5/4/2017 22:09:13'!
top
	"Return the top value, without discarding it"
	
	^ topItem itemValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'NC 5/4/2017 21:39:09'!
new 
	"Create a new instance"

	| aNewStack anEmptyState |
	
	anEmptyState := EmptyItem new.

	aNewStack := super new.
	aNewStack initializeWith: anEmptyState.
	^ aNewStack.! !


!classDefinition: #StackItem category: #'Stack-Exercise'!
Object subclass: #StackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:42:29'!
hasValue
	"Return whether the item has a value"

	self subclassResponsibility ! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:39:37'!
itemValue
	"Return the value the item holds"

	self subclassResponsibility ! !


!classDefinition: #EmptyItem category: #'Stack-Exercise'!
StackItem subclass: #EmptyItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:42:51'!
hasValue
	
	^ false! !

!EmptyItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:39:59'!
itemValue
	
	self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #ValuedItem category: #'Stack-Exercise'!
StackItem subclass: #ValuedItem
	instanceVariableNames: 'value previousItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValuedItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:46:10'!
hasValue
	
	^ true! !

!ValuedItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 21:46:20'!
itemValue
	
	^ value! !

!ValuedItem methodsFor: 'as yet unclassified' stamp: 'NC 5/4/2017 22:09:35'!
previousItem
	"Return the previous item in the stack"

	^ previousItem! !


!ValuedItem methodsFor: 'initialization' stamp: 'NC 5/4/2017 21:56:17'!
initializeWithValue: aValue andPreviousItem: aStackItem

	value := aValue.
	previousItem := aStackItem.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValuedItem class' category: #'Stack-Exercise'!
ValuedItem class
	instanceVariableNames: ''!

!ValuedItem class methodsFor: 'instance creation' stamp: 'NC 5/4/2017 21:56:54'!
createWithValue: aValue andItem: aStackItem
	"Create an instance with a value"

	| newItem |

	newItem := self new.
	newItem initializeWithValue: aValue andPreviousItem: aStackItem.
	^ newItem! !
