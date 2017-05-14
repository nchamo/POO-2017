'From Cuis 5.0 of 7 November 2016 [latest update: #3076] on 14 May 2017 at 8:21:29 am'!
'Description Please enter a description for this package'!
!provides: 'GOL' 1 1!
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


!Rectangle methodsFor: '*GOL' stamp: 'PV 5/14/2017 06:41:26'!
points
	| enumeratedPoints |
	
	enumeratedPoints := Set new.
	
	0 to: corner x - 1 do: [ :x | 
		0 to: corner y - 1 do: [ :y |
			enumeratedPoints add: x@y]].

	^enumeratedPoints! !

!Rectangle methodsFor: '*GOL' stamp: 'PV 5/14/2017 06:40:55'!
substractPoints: aCollectionOfPoints
	
	^self points select: [ :aPoint | (aCollectionOfPoints includes: aPoint) not ]! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 02:10:30'!
newWithLiveCells: aCollectionOfLiveCells andSize: aSize
	
	^ GameOfLife withLiveCells: aCollectionOfLiveCells withSize: aSize.! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 02:14:21'!
test01AliveCellWithLessThanTwoAliveNeighDies

	| game |
	
	game := self newWithLiveCells: { 1@1 }  andSize: 3@3.

	game nextGeneration.
	
	self assert: (game isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:43:55'!
test02AliveCellWithTwoAliveNeighStaysAlive

	| game |
	
	game := self newWithLiveCells: { 1@1. 2@0. 1@0. } andSize: 3@3.
	game nextGeneration.
	
	self assert: (game isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:44:57'!
test03AliveCellWithThreeAliveNeighStaysAlive

	| game |

	game := self newWithLiveCells: { 1@1. 2@0. 1@0. 1@2. } andSize: 3@3.
	game nextGeneration.
	
	self assert: (game isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 02:18:28'!
test04AliveCellWithMoreThanThreeAliveNeighDies

	| game |

	game := self newWithLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } andSize: 3@3.
	game nextGeneration.

	self assert: (game isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:45:11'!
test05DeadCellWithThreeAliveNeighResurrects

	| game |

	game := self newWithLiveCells: { 2@0. 1@0. 0@0 } andSize: 3@3.
	game nextGeneration.

	self assert: (game isAliveAt: 1@1)! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:02:11'!
test06CreateCellOutsideBoundsFails

	self
		should: [ self newWithLiveCells: { 2@0. 1@0. 1@4 } andSize: 3@3. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:31:20'!
test07CreateCellInBorderDoesntFail

	self
		shouldnt: [ self newWithLiveCells: { 2@0. 1@0. 1@3 } andSize: 3@3. ]
		raise: Error! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 07:13:15'!
test08DeadCellsWorksWithTwoByTwoBoard

	| game |

	game := self newWithLiveCells: { 0@0. 1@0. 0@1 } andSize: 1@1.
	
	self assert: game deadCells = { 1@1 } asSet ! !

!RectangleTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:49:24'!
test01SubstractPointsFromATwoByTwoRectangleWorks

	| rectangle resultingPoints |

	rectangle := Rectangle origin: 0@0 corner: 2@2.

	resultingPoints := rectangle substractPoints: { 0@1. 1@1 }.
	
	^self assert: resultingPoints = { 0@0. 1@0 } asSet! !

!RectangleTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:20:50'!
test02PointsContainsAllRectanglePointsForOneByOneRect

	| rectangle |

	rectangle := Rectangle origin: 0@0 corner: 1@1.
	
	^self assert: rectangle points = {0@0.} asSet! !

!RectangleTest methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:22:08'!
test03PointsContainsAllRectanglePointsForTwoByTwoRect

	| rectangle |

	rectangle := Rectangle origin: 0@0 corner: 2@2.
	
	^self assert: rectangle points = {0@0. 0@1. 1@0. 1@1.} asSet! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 07:18:15'!
deadCells

	^ board substractPoints: aliveCells! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'PV 5/14/2017 07:16:04'!
initializeWith: aCollectionOfAliveCells andBoard: aBoard

	aliveCells := aCollectionOfAliveCells.
	board := aBoard.! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:45:52'!
isAliveAt: aCell

	^aliveCells includes: aCell! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:46:24'!
isDeadAt: aCell

	^(self isAliveAt: aCell)not! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'PV 5/14/2017 06:58:56'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :anAliveCell | self hasToSurvive: anAliveCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !

!GameOfLife class methodsFor: 'instance creation' stamp: 'PV 5/14/2017 07:22:36'!
withLiveCells: aCollectionOfAliveCells withSize: aSize
	"Note that Rectangle corner is exclusive. That's the reason why it's necessary to add 1@1 to the size to get the corner."

	| board |
	
	board := Rectangle origin: 0@0 corner: aSize + (1@1).

	(aCollectionOfAliveCells allSatisfy: [ :aCell | board containsPoint: aCell]) ifFalse: [ self error: 'celda fuera de rango' ].

	^self new initializeWith: aCollectionOfAliveCells andBoard: board! !
