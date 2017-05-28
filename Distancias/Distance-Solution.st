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

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:56:37'!
test05
	"dosMetros - cienCentimetros = milMilimetros"

	self assert: twoMeters - oneHundredCentimeters = oneThousandMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:14:22'!
test06

	self assert: oneThousandMilimeters = oneHundredCentimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:20:36'!
test07

	self assert: oneMeter - oneMeter = zeroMilimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:33:35'!
test08

	self assert: oneMeter + oneHundredCentimeters = twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:38:35'!
test09

	self assert: oneHundredMilimeters + oneHundredMilimeters  = twoHundredMilimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/28/2017 00:53:25'!
test10
	"unMetro * 2 = dosMetros"
	
	self assert: oneMeter * 2 equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/28/2017 00:55:34'!
test11
	"unMetro / 2 = unMedioMetro"
	
	self assert: oneMeter / 2 equals: oneHalfMeter 
	! !


!DistanceTest methodsFor: 'setup' stamp: 'NC 5/28/2017 00:54:51'!
setUp

	oneMeter := Meter withLength: 1.
	oneHundredCentimeters := Centimeter withLength: 100.
	oneThousandMilimeters := Milimeters withLength: 1000.
	twoMeters := Meter withLength: 2.
	zeroMeters := Meter withLength: 0.
	zeroCentimeters := Centimeter withLength: 0.
	ninetyCentimeters := Centimeter withLength: 90.
	oneHundredMilimeters := Milimeters withLength: 100.
	zeroMilimeters := Milimeters withLength: 0.
	anotherMeter := Meter withLength: 1.
	twoHundredMilimeters := Milimeters withLength: 200.
	oneHalfMeter := Meter withLength: 0.5.! !


!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: 'magnitude unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distance methodsFor: 'arithmetic' stamp: 'NC 5/28/2017 00:50:48'!
* aNumber

	^ Meter withLength: self toMeter length * aNumber! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/26/2017 05:46:48'!
+ aDistance

	^ Meter withLength: self toMeter length + aDistance toMeter length! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 5/26/2017 05:48:18'!
- aDistance

	^ Meter withLength: self toMeter length - aDistance toMeter length! !

!Distance methodsFor: 'arithmetic' stamp: 'NC 5/28/2017 00:55:48'!
/ aNumber

	^ Meter withLength: self toMeter length / aNumber! !


!Distance methodsFor: 'comparing' stamp: 'PV 5/26/2017 05:42:44'!
= aDistance

	^ self toMeter length = aDistance toMeter length! !


!Distance methodsFor: 'accessing' stamp: 'NC 5/28/2017 01:24:20'!
length
	"Return the magnitude of the distance, in this unit."

	^ magnitude! !


!classDefinition: #Centimeter category: #'Distance-Solution'!
Distance subclass: #Centimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimeter methodsFor: 'initialization' stamp: 'NC 5/28/2017 01:16:38'!
initializeWithLength: aLength 
	
	magnitude := aLength! !


!Centimeter methodsFor: 'converting' stamp: 'NC 5/28/2017 01:17:34'!
toMeter
	"Convert this unit to meters"
	
	^ Meter withLength: magnitude / 100! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #'Distance-Solution'!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 13:01:44'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !


!classDefinition: #Meter category: #'Distance-Solution'!
Distance subclass: #Meter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Meter methodsFor: 'initialization' stamp: 'NC 5/28/2017 01:16:18'!
initializeWithLength: aLength 
	
	magnitude := aLength! !


!Meter methodsFor: 'converting' stamp: 'NC 5/20/2017 13:06:11'!
toMeter
	"Convert this unit to meters"
	
	^ self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #'Distance-Solution'!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 12:17:18'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !


!classDefinition: #Milimeters category: #'Distance-Solution'!
Distance subclass: #Milimeters
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimeters methodsFor: 'initialization' stamp: 'NC 5/28/2017 01:15:48'!
initializeWithLength: aLength 
	
	magnitude := aLength! !


!Milimeters methodsFor: 'converting' stamp: 'NC 5/28/2017 01:17:42'!
toMeter
	"Convert this unit to meters"
	
	^ Meter withLength: magnitude / 1000! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeters class' category: #'Distance-Solution'!
Milimeters class
	instanceVariableNames: ''!

!Milimeters class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 13:24:43'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'distance creation' stamp: 'NC 5/28/2017 01:28:35'!
oneCentimeter
 
	^ Centimeter withLength: 1! !
