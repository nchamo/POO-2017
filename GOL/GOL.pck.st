'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 15 May 2017 at 6:19:35 pm'!
'Description Please enter a description for this package'!
!provides: 'GOL' 1 7!
!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!
!classDefinition: 'GOLTest class' category: #GOL!
GOLTest class
	instanceVariableNames: ''!

!classDefinition: #RectangleTest category: #GOL!
TestCase subclass: #RectangleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!
!classDefinition: 'RectangleTest class' category: #GOL!
RectangleTest class
	instanceVariableNames: ''!

!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!
!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!


!Rectangle methodsFor: '*GOL' stamp: 'NC 5/14/2017 13:15:38'!
points
	| enumeratedPoints |
	
	enumeratedPoints := Set new.
	
	origin x to: corner x - 1 do: [ :x | 
		origin y to: corner y - 1 do: [ :y |
			enumeratedPoints add: x@y]].

	^ enumeratedPoints! !

!GOLTest methodsFor: 'private' stamp: 'NC 5/14/2017 12:42:08'!
boardCreationFailsWithCells: aCollectionOfLiveCells andSize: aSize
	
	self
		should: [ self newWithLiveCells: aCollectionOfLiveCells andSize: aSize. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: GameOfLife cellOutOfBoundsExceptionDescription ]
! !

!GOLTest methodsFor: 'private' stamp: 'PV 5/14/2017 02:10:30'!
newWithLiveCells: aCollectionOfLiveCells andSize: aSize
	
	^ GameOfLife withLiveCells: aCollectionOfLiveCells withSize: aSize.! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/14/2017 02:14:21'!
test01AliveCellWithLessThanTwoAliveNeighDies

	| game |
	
	game := self newWithLiveCells: { 1@1 }  andSize: 3@3.

	game nextGeneration.
	
	self assert: (game isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'testing' stamp: 'NC 5/14/2017 14:35:18'!
test02AliveCellWithTwoAliveNeighStaysAlive

	| game |
	
	game := self newWithLiveCells: { 1@1. 2@0. 1@0. } andSize: 3@3.

	game nextGeneration.

	self assert: (game isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'testing' stamp: 'NC 5/14/2017 14:35:32'!
test03AliveCellWithThreeAliveNeighStaysAlive

	| game |

	game := self newWithLiveCells: { 1@1. 2@0. 1@0. 1@2. } andSize: 3@3.

	game nextGeneration.

	self assert: (game isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'testing' stamp: 'NC 5/14/2017 14:35:36'!
test04AliveCellWithMoreThanThreeAliveNeighDies

	| game |

	game := self newWithLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } andSize: 3@3.

	game nextGeneration.

	self assert: (game isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'testing' stamp: 'NC 5/14/2017 14:35:50'!
test05DeadCellWithThreeAliveNeighResurrects

	| game |

	game := self newWithLiveCells: { 2@0. 1@0. 0@0 } andSize: 3@3.

	game nextGeneration.

	self assert: (game isAliveAt: 1@1)! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/15/2017 18:15:11'!
test06BoardCreationWIthCellOutOfBoundsFails

	self boardCreationFailsWithCells: { 2@0. 1@0. 1@6 } andSize: 3@3.
! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/15/2017 18:12:54'!
test07BoardCreationWIthCellOutOfBoundsJustOverBorderFails

	self boardCreationFailsWithCells: { 2@0. 1@0. 1@4 } andSize: 3@3.! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/15/2017 18:14:25'!
test08BoardCreationWIthCellOutOfBoundsAndNegativePositionFails

	self boardCreationFailsWithCells: { 2@0. 1@0. -1@2 } andSize: 3@3.
! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/15/2017 18:15:38'!
test09BoardCreationWIthCellInBoundsDoesntFail

	self
		shouldnt: [ self newWithLiveCells: { 2@0. 1@0. 1@3 } andSize: 3@3. ]
		raise: Error! !

!GOLTest methodsFor: 'testing' stamp: 'PV 5/15/2017 18:11:36'!
test10RepeatedAliveCellsAreConsideredAsOne

	| game |
	
	game := self newWithLiveCells: { 2@0. 2@0. } andSize: 3@3. 
	
	self assert: game numberOfAliveCells = 1! !

!RectangleTest methodsFor: 'testing' stamp: 'NC 5/14/2017 13:06:03'!
test01PointsContainsAllRectanglePointsForOneByOneRect

	| rectangle |

	rectangle := Rectangle origin: 0@0 corner: 1@1.
	
	^self assert: rectangle points = {0@0.} asSet! !

!RectangleTest methodsFor: 'testing' stamp: 'NC 5/14/2017 13:06:38'!
test02PointsContainsAllRectanglePointsForTwoByTwoRect

	| rectangle |

	rectangle := Rectangle origin: 0@0 corner: 2@2.
	
	^self assert: rectangle points = {0@0 . 0@1 . 1@0 . 1@1.} asSet! !

!RectangleTest methodsFor: 'testing' stamp: 'NC 5/14/2017 13:16:40'!
test03PointsWorksWithRectangleWithOriginOtherThanZeroZero
 
	| rectangle |
 
 	rectangle := Rectangle origin: 1@1 corner: 2@2.
 	
 	^ self assert: rectangle points = {1@1.} asSet
 ! !

!GameOfLife methodsFor: 'private' stamp: 'NC 5/14/2017 13:05:07'!
deadCells

	^ board points difference: aliveCells! !

!GameOfLife methodsFor: 'private' stamp: 'NC 5/14/2017 12:22:27'!
hasToResurrect: aCell

	^ (self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'NC 5/14/2017 12:22:40'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours |
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^ numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'initialization' stamp: 'PV 5/14/2017 07:16:04'!
initializeWith: aCollectionOfAliveCells andBoard: aBoard

	aliveCells := aCollectionOfAliveCells.
	board := aBoard.! !

!GameOfLife methodsFor: 'testing' stamp: 'NC 5/14/2017 12:23:07'!
isAliveAt: aCell

	^ aliveCells includes: aCell! !

!GameOfLife methodsFor: 'testing' stamp: 'NC 5/14/2017 12:23:14'!
isDeadAt: aCell

	^ (self isAliveAt: aCell) not! !

!GameOfLife methodsFor: 'game operations' stamp: 'PV 5/14/2017 06:58:56'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :anAliveCell | self hasToSurvive: anAliveCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !

!GameOfLife methodsFor: 'testing' stamp: 'NC 5/14/2017 12:46:24'!
numberOfAliveCells

	^ aliveCells size! !

!GameOfLife methodsFor: 'private' stamp: 'NC 5/14/2017 12:31:16'!
numberOfAliveNeighboursOf: aCell

	^ (aCell eightNeighbors intersection: aliveCells) size! !

!GameOfLife class methodsFor: 'error messages' stamp: 'NC 5/14/2017 12:26:40'!
cellOutOfBoundsExceptionDescription
	
	^  'Cell out of bounds'.

	
	! !

!GameOfLife class methodsFor: 'instance creation' stamp: 'NC 5/14/2017 12:33:49'!
withLiveCells: aCollectionOfAliveCells withSize: aSize
	"Note that Rectangle corner is exclusive. That's the reason why it's necessary to add 1@1 to the size to get the corner."

	| board |
	
	board := Rectangle origin: 0@0 corner: aSize + (1@1).

	(aCollectionOfAliveCells allSatisfy: [ :aCell | board containsPoint: aCell]) ifFalse: [ self error: self cellOutOfBoundsExceptionDescription ].

	^self new initializeWith: aCollectionOfAliveCells asSet andBoard: board! !
