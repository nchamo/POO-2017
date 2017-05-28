!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMilimeters twoMeters zeroMeters zeroCentimeters ninetyCentimeters oneHundredMilimeters zeroMilimeters anotherMeter twoHundredMilimeters oneHalfMeter'
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

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/28/2017 10:01:16'!
test05
	"dosMetros - cienCentimetros = milMilimetros"

	self assert: twoMeters - oneHundredCentimeters equals: oneThousandMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/28/2017 10:04:02'!
test06

	self assert: oneThousandMilimeters equals: oneHundredCentimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/28/2017 10:04:14'!
test07

	self assert: oneMeter - oneMeter equals: zeroMilimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/28/2017 10:04:23'!
test08

	self assert: oneMeter + oneHundredCentimeters equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/28/2017 10:04:32'!
test09

	self assert: oneHundredMilimeters + oneHundredMilimeters  equals: twoHundredMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/28/2017 00:53:25'!
test10
	"unMetro * 2 = dosMetros"
	
	self assert: oneMeter * 2 equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/28/2017 00:55:34'!
test11
	"unMetro / 2 = unMedioMetro"
	
	self assert: oneMeter / 2 equals: oneHalfMeter 
	! !


!DistanceTest methodsFor: 'setup' stamp: 'PV 5/28/2017 10:22:24'!
setUp

	oneMeter :=  self meters: 1.
	anotherMeter := self meters: 1.
	twoMeters := self meters: 2.
	zeroMeters := self meters: 0.
	oneHalfMeter := self meters: 0.5.

	oneHundredCentimeters := self centimeters: 100.
	zeroCentimeters := self centimeters: 0.
	ninetyCentimeters := self centimeters: 90.

	oneThousandMilimeters := self milimeters: 1000.
	oneHundredMilimeters := self milimeters: 100.
	zeroMilimeters := self milimeters: 0.
	twoHundredMilimeters := self milimeters: 200.! !


!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/28/2017 09:45:20'!
centimeters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Centimeter! !

!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/28/2017 09:45:27'!
meters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Meter! !

!DistanceTest methodsFor: 'distance instances creation' stamp: 'PV 5/28/2017 09:45:15'!
milimeters: aMagnitude

	^ Distance magnitude: aMagnitude unit: Milimeter! !


!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: 'magnitude unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:22:57'!
* aMultiplier

	magnitude := magnitude * aMultiplier! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:23:01'!
+ aDistance

	^ self class magnitude: self distanceInMeters + aDistance distanceInMeters unit: Meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:03:50'!
- aDistance

	^ self class magnitude: self distanceInMeters - aDistance distanceInMeters unit: Meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/28/2017 10:08:32'!
/ aDivider

	magnitude := magnitude / aDivider! !


!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 10:23:20'!
= aDistance

	^ self distanceInMeters = aDistance distanceInMeters! !


!Distance methodsFor: 'initialization' stamp: 'PV 5/28/2017 10:17:39'!
initializeWithMagnitude: aMagnitude andUnit: aUnit

	magnitude := aMagnitude.
	unit := aUnit.
	! !


!Distance methodsFor: 'converting' stamp: 'PV 5/28/2017 09:11:39'!
distanceInMeters

	^ magnitude * unit distanceInMeters! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'initialization' stamp: 'PV 5/28/2017 10:23:41'!
magnitude: aMagnitude unit: aUnit
	
	^ self new initializeWithMagnitude: aMagnitude andUnit: aUnit! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 5/28/2017 10:24:12'!
oneCentimeter

	^ Centimeter withLength: 1! !


!classDefinition: #DistanceUnit category: #'Distance-Solution'!
Object subclass: #DistanceUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnit class' category: #'Distance-Solution'!
DistanceUnit class
	instanceVariableNames: ''!

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'PV 5/28/2017 10:13:52'!
distanceInMeters

	self shouldBeImplemented! !


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
