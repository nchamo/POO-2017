!classDefinition: #DistanceInterval category: #'Distance-Solution'!
SequenceableCollection subclass: #DistanceInterval
	instanceVariableNames: 'interval unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:05:59'!
at: aPosition

	^ Distance magnitude: (interval at: aPosition) unit: unit.! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:05:07'!
first

	^ Distance magnitude: interval first unit: unit! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:16:16'!
interval

	^ interval! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:06:20'!
last
	
	^ Distance magnitude: interval last unit: unit.! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 5/28/2017 18:20:41'!
size
	 
	^ interval size! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:17:17'!
unit

	^ unit! !


!DistanceInterval methodsFor: 'enumerating' stamp: 'NC 5/30/2017 18:51:02'!
do: aBlock

	interval do: [ :aMagnitude | aBlock value: (Distance magnitudeInMeters: aMagnitude unit: unit) ]! !


!DistanceInterval methodsFor: 'initialization' stamp: 'NC 5/28/2017 17:19:25'!
initializeWithInterval: anInterval andUnit: aUnit
	
	interval := anInterval.
	unit := aUnit! !


!DistanceInterval methodsFor: 'arithmetic' stamp: 'PV 5/30/2017 16:10:37'!
+ aDistance

	^ self class interval: interval + (aDistance distanceIn: unit) unit: unit! !

!DistanceInterval methodsFor: 'arithmetic' stamp: 'PV 5/30/2017 16:18:22'!
- aDistance

	^ self class interval: interval - (aDistance distanceIn: unit) unit: unit! !


!DistanceInterval methodsFor: 'comparing' stamp: 'PV 5/30/2017 16:16:57'!
= aDistanceInterval

	^ aDistanceInterval interval = interval and: aDistanceInterval unit = unit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceInterval class' category: #'Distance-Solution'!
DistanceInterval class
	instanceVariableNames: ''!

!DistanceInterval class methodsFor: 'instance creation' stamp: 'NC 5/30/2017 17:21:19'!
from: startDistance to: stopDistance

	^ self from: startDistance to: stopDistance by: (Distance magnitude: 1 unit: startDistance unit)
! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'NC 5/30/2017 18:46:01'!
from: startDistance to: stopDistance by: stepDistance
	"unMetro to: diezKilometros by: cincoCentimetros
	from: 1 to: 10000 by: 0.05 unit: centimetros
	"
	
	| unit |
	
	stopDistance < startDistance ifTrue: [self error: self endShouldBeBiggerThatStartMessageDescription.].

	unit := stepDistance unit.

	^ self interval:
		(Interval
			from: (startDistance distanceIn: unit)
			to: (stopDistance distanceIn: unit)
			by: stepDistance magnitude)
		unit: unit
		
! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'PV 5/30/2017 15:49:38'!
interval: anInterval unit: aDistanceUnit

	^ self new initializeWithInterval: anInterval andUnit: aDistanceUnit ! !


!DistanceInterval class methodsFor: 'error messages' stamp: 'NC 5/30/2017 17:21:03'!
endShouldBeBiggerThatStartMessageDescription

	^ 'End of the interval should be bigger that start'! !


!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMilimeters twoMeters zeroMeters zeroCentimeters ninetyCentimeters oneHundredMilimeters zeroMilimeters anotherMeter twoHundredMilimeters oneHalfMeter tenKilometers threeMeters fiveCentimeters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:51:24'!
test01DistanceUnitsOfSameTypeAndLengthAreEqual
	
	self assert: oneMeter equals: anotherMeter
	
	! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:33:52'!
test02DistanceUnitsOfSameTypeCanBeAdded

	self assert: oneMeter + oneMeter equals: twoMeters
	
	! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:22:32'!
test03OneMeterEqualsOneHundredCentimeters

	self assert: oneMeter equals: oneHundredCentimeters 
	
	! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:25:31'!
test04OneHundredCentimetersEqualsOneThousandMilimeters

	self assert: oneHundredCentimeters equals: oneThousandMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/30/2017 14:28:25'!
test05TwoMetersMinusOneHundredCentimetersEqualsOneThousandMilimeters
	"dosMetros - cienCentimetros = milMilimetros"

	self assert: twoMeters - oneHundredCentimeters equals: oneThousandMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:42:07'!
test06OneThousandMilimetersEqualsOneHoundredCentimeters

	self assert: oneThousandMilimeters equals: oneHundredCentimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:42:23'!
test07OneMeterMinusOneMeterEqualsZeroMilimeters

	self assert: oneMeter - oneMeter equals: zeroMilimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:42:44'!
test08OneMeterPlusOneHundrerCentimeterEqualsTwoMeters

	self assert: oneMeter + oneHundredCentimeters equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:43:15'!
test09OneHoundredMilimetersPlusOneHundredMilimetersEqualsTwoHundrerMilimeters

	self assert: oneHundredMilimeters + oneHundredMilimeters equals: twoHundredMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:43:37'!
test10ProductWithNumbersAreCorrect
	"unMetro * 2 = dosMetros
	2 * unMetro = dosMetros"

	self assert: oneMeter * 2 equals: twoMeters.
	self assert: 2 * oneMeter equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:43:52'!
test11DivisionByNumberWorks
	"unMetro / 2 = unMedioMetro"

	self assert: oneMeter / 2 equals: oneHalfMeter! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:44:03'!
test12InequalityRelations
	"diezKilometros > unMetro"
	self assert: tenKilometers > oneMeter.

	"unMetro < tresMetros"
	self assert: oneMeter < threeMeters.

	"diezKilometros >= unMetro"
	self assert: tenKilometers >= oneMeter.

	"unMetro <= tresMetros"
	self assert: oneMeter <= threeMeters.! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:44:27'!
test13IntervalIsCorrect
	"unMetro to: tresMetros  <-- representa un intervalo que va desde un metro a tres metros con pasos de un metro"

	self assert: ((oneMeter to: threeMeters) as: Array) equals: {oneMeter. twoMeters. threeMeters}! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:44:52'!
test14IntervalWithByIsCorrect
	"unMetro to: diezKilometros by: cincoCentimetros <-- representa un intervalo que va de un metro a diez kilometors cada cinco centimetros"

	| aDistanceInterval |

	aDistanceInterval := oneMeter to: tenKilometers by: fiveCentimeters.
	
	self assert: aDistanceInterval first equals: oneMeter.
	self assert: (aDistanceInterval at: 2) equals: oneMeter + fiveCentimeters.
	self assert: (aDistanceInterval at: 3) equals: oneMeter + (2 * fiveCentimeters).
	self assert: aDistanceInterval last equals: tenKilometers.
	
	self assert: aDistanceInterval size equals:
		(self equivalentIntervalFromStart: oneMeter stop: tenKilometers step: fiveCentimeters) size.! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:45:00'!
test15IntervalIterationWorks
	"unMetro to: diezKilometros by: cincoCentimetros do:[...] <-- permite recorrer el intervalo"

	| count | 

	count := 0.
	
	oneMeter to: tenKilometers by: fiveCentimeters do: [ :aDistance | count := count + 1].
	
	self assert: count equals:
		(self equivalentIntervalFromStart: oneMeter stop: tenKilometers step: fiveCentimeters) size.! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/30/2017 16:50:22'!
test16DistanceIntervalBehavesLikeAnInterval

	| aDistanceInterval plusOneMeter minusOneMeter |
	
	aDistanceInterval := oneMeter to: tenKilometers by: fiveCentimeters.
	plusOneMeter := oneMeter + oneMeter to: tenKilometers + oneMeter by: fiveCentimeters.
	minusOneMeter := oneMeter - oneMeter to: tenKilometers - oneMeter by: fiveCentimeters.

	self assert: aDistanceInterval + oneMeter equals: plusOneMeter.
	self assert: aDistanceInterval - oneMeter equals: minusOneMeter.! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 17:16:55'!
test17CantCreateNegativeDistance

	self should: [ Distance magnitude: -1 unit: Meter. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Distance negativeErrorMessageDescription ]! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 17:19:05'!
test18IntervalEndIsBiggerThanStart

	self should: [ DistanceInterval from: oneMeter to: oneHalfMeter ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: DistanceInterval endShouldBeBiggerThatStartMessageDescription]! !


!DistanceTest methodsFor: 'setup' stamp: 'NC 5/28/2017 17:59:27'!
setUp

	oneMeter :=  self meters: 1.
	anotherMeter := self meters: 1.
	twoMeters := self meters: 2.
	zeroMeters := self meters: 0.
	oneHalfMeter := self meters: 0.5.
	threeMeters := self meters: 3.

	oneHundredCentimeters := self centimeters: 100.
	zeroCentimeters := self centimeters: 0.
	ninetyCentimeters := self centimeters: 90.
	fiveCentimeters := self centimeters: 5.
	
	oneThousandMilimeters := self milimeters: 1000.
	oneHundredMilimeters := self milimeters: 100.
	zeroMilimeters := self milimeters: 0.
	twoHundredMilimeters := self milimeters: 200.
	
	tenKilometers := self kilometers: 10.! !


!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/30/2017 15:01:18'!
centimeters: aMagnitude

	^ DistanceFactory new centimeters: aMagnitude! !

!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/30/2017 15:02:51'!
kilometers: aMagnitude

	^ DistanceFactory new kilometers: aMagnitude! !

!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/30/2017 15:01:45'!
meters: aMagnitude

	^ DistanceFactory new meters: aMagnitude! !

!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/30/2017 15:02:39'!
milimeters: aMagnitude

	^ DistanceFactory new milimeters: aMagnitude! !


!DistanceTest methodsFor: 'private' stamp: 'PV 5/30/2017 05:49:14'!
equivalentIntervalFromStart: startDistance stop: stopDistance step: stepDistance

	^ Interval from: (startDistance distanceIn: stepDistance unit)
		to: (stopDistance distanceIn: stepDistance unit)
		by: stepDistance magnitude! !


!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: 'magnitude unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distance methodsFor: 'arithmetic' stamp: 'NC 5/28/2017 18:50:39'!
* aMultiplier

	^ self class magnitude: magnitude * aMultiplier unit: unit! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:23:01'!
+ aDistance

	^ self class magnitude: self distanceInMeters + aDistance distanceInMeters unit: Meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:03:50'!
- aDistance

	^ self class magnitude: self distanceInMeters - aDistance distanceInMeters unit: Meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:08:32'!
/ aDivider

	magnitude := magnitude / aDivider! !

!Distance methodsFor: 'arithmetic' stamp: 'NC 5/28/2017 18:50:52'!
adaptToNumber: aMultiplier andSend: anOperationSymbol

	anOperationSymbol = #* ifFalse: [
		self error: 'Distance only knows how to adapt to a number when the operation is the multiplication' ].

	^ self class magnitude: magnitude * aMultiplier unit: unit.! !


!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:19:56'!
< aDistance

	^ self compare: aDistance with: #<! !

!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:27:55'!
<= aDistance 

	^ self compare: aDistance with: #<=! !

!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:20:20'!
= aDistance

	^ self compare: aDistance with: #=! !

!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:20:13'!
> aDistance 

	^ self compare: aDistance with: #>! !

!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:23:32'!
>= aDistance 

	^ self compare: aDistance with: #>=! !


!Distance methodsFor: 'initialization' stamp: 'PV 5/28/2017 10:17:39'!
initializeWithMagnitude: aMagnitude andUnit: aUnit

	magnitude := aMagnitude.
	unit := aUnit.
	! !


!Distance methodsFor: 'converting' stamp: 'PV 5/30/2017 00:07:33'!
distanceIn: aDistanceUnit

	^ magnitude * unit distanceInMeters / aDistanceUnit distanceInMeters! !

!Distance methodsFor: 'converting' stamp: 'PV 5/30/2017 06:19:52'!
distanceInMeters

	^ self distanceIn: Meter! !


!Distance methodsFor: 'private' stamp: 'PV 5/28/2017 12:19:37'!
compare: aDistance with: anOperatorSymbol

	^ self distanceInMeters perform: anOperatorSymbol with: aDistance distanceInMeters! !


!Distance methodsFor: 'stepping' stamp: 'PV 5/28/2017 12:56:27'!
to: aDistance 

	^ DistanceInterval from: self to: aDistance ! !

!Distance methodsFor: 'stepping' stamp: 'NC 5/28/2017 18:02:13'!
to: aDistance by: anotherDistance

	^ DistanceInterval from: self to: aDistance by: anotherDistance! !

!Distance methodsFor: 'stepping' stamp: 'NC 5/28/2017 19:10:01'!
to: aDistance by: anotherDistance do: aBlock
		
	(DistanceInterval from: self to: aDistance by: anotherDistance) do: aBlock
	! !

!Distance methodsFor: 'stepping' stamp: 'PV 5/30/2017 15:30:58'!
to: stopDistance count: n
	"Answer aDistanceInterval from the receiver up to the argument, stopDistance, 
	with n elements."

	^ DistanceInterval from: self to: stopDistance count: n! !


!Distance methodsFor: 'accessing' stamp: 'PV 5/29/2017 23:58:10'!
magnitude

	^ magnitude ! !

!Distance methodsFor: 'accessing' stamp: 'NC 5/28/2017 17:17:35'!
unit
	
	^ unit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'initialization' stamp: 'NC 5/30/2017 17:16:06'!
magnitude: aMagnitude unit: aUnit
	
	aMagnitude < 0  ifTrue: [self error: self negativeErrorMessageDescription].
	
	^ self new initializeWithMagnitude: aMagnitude andUnit: aUnit! !

!Distance class methodsFor: 'initialization' stamp: 'NC 5/30/2017 17:13:20'!
magnitudeInMeters: aMagnitudeInMeters unit: aUnit
	
	^ self magnitude: aMagnitudeInMeters / (aUnit distanceInMeters)  unit: aUnit! !


!Distance class methodsFor: 'error messages' stamp: 'NC 5/30/2017 17:12:34'!
negativeErrorMessageDescription

	^ 'No se puede crear una distancia negativa'! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:55:12'!
centimeters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Centimeter! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 15:02:01'!
kilometers: aMagnitude

	^ Distance magnitude: aMagnitude unit: Kilometer! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:55:24'!
meters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Meter! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 15:02:14'!
milimeters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Milimeter! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:55:56'!
minusOneMeter

	^ self meters: -1! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:56:21'!
oneCentimeter

	^ self centimeters: 1! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:58:53'!
oneHundredCentimeters

	^ self centimeters: 100! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:58:34'!
oneMeter

	^ self meters: 1! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:59:10'!
twoHundredCentimeters

	^ self centimeters: 200! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:59:23'!
twoMeters

	^ self meters: 2! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/30/2017 14:59:37'!
zeroMeters

	^ self meters: 0! !


!classDefinition: #DistanceUnit category: #'Distance-Solution'!
Object subclass: #DistanceUnit
	instanceVariableNames: 'interval unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnit class' category: #'Distance-Solution'!
DistanceUnit class
	instanceVariableNames: ''!

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'PV 5/28/2017 11:51:38'!
distanceInMeters

	self subclassResponsibility! !


!classDefinition: #Centimeter category: #'Distance-Solution'!
DistanceUnit subclass: #Centimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #'Distance-Solution'!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'converting' stamp: 'PV 5/28/2017 09:55:01'!
distanceInMeters

	^ 1/100! !


!classDefinition: #Kilometer category: #'Distance-Solution'!
DistanceUnit subclass: #Kilometer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Kilometer class' category: #'Distance-Solution'!
Kilometer class
	instanceVariableNames: ''!

!Kilometer class methodsFor: 'converting' stamp: 'PV 5/28/2017 12:07:49'!
distanceInMeters

	^ 1000! !


!classDefinition: #Meter category: #'Distance-Solution'!
DistanceUnit subclass: #Meter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #'Distance-Solution'!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'converting' stamp: 'PV 5/28/2017 09:12:21'!
distanceInMeters

	^ 1! !


!classDefinition: #Milimeter category: #'Distance-Solution'!
DistanceUnit subclass: #Milimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeter class' category: #'Distance-Solution'!
Milimeter class
	instanceVariableNames: ''!

!Milimeter class methodsFor: 'converting' stamp: 'PV 5/28/2017 09:56:41'!
distanceInMeters

	^ 1/1000! !
