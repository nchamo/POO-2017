!classDefinition: #DistanciasTest category: #Distancias!
TestCase subclass: #DistanciasTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMilimeters twoMeters zeroMeters zeroCentimeters ninetyCentimeters oneHundredMilimeters zeroMilimeters anotherMeter twoHundredMilimeters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:51:24'!
test01DistanceUnitsOfSameTypeAndLengthAreEqual
	
	self assert: oneMeter equals: anotherMeter
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:33:52'!
test02DistanceUnitsOfSameTypeCanBeAdded

	self assert: oneMeter + oneMeter equals: twoMeters
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:22:32'!
test03OneMeterEqualsOneHundredCentimeters

	self assert: oneMeter equals: oneHundredCentimeters 
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:25:31'!
test04OneHundredCentimetersEqualsOneThousandMilimeters

	self assert: oneHundredCentimeters equals: oneThousandMilimeters! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 04:56:37'!
test05
	"dosMetros - cienCentimetros = milMilimetros"

	self assert: twoMeters - oneHundredCentimeters = oneThousandMilimeters! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:14:22'!
test06

	self assert: oneThousandMilimeters = oneHundredCentimeters ! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:20:36'!
test07

	self assert: oneMeter - oneMeter = zeroMilimeters ! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:33:35'!
test08

	self assert: oneMeter + oneHundredCentimeters = twoMeters! !

!DistanciasTest methodsFor: 'testing' stamp: 'PV 5/26/2017 05:38:35'!
test09

	self assert: oneHundredMilimeters + oneHundredMilimeters  = twoHundredMilimeters! !


!DistanciasTest methodsFor: 'setup' stamp: 'PV 5/26/2017 05:39:04'!
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
	twoHundredMilimeters := Milimeters withLength: 200.! !


!classDefinition: #DistanceUnit category: #Distancias!
Object subclass: #DistanceUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'PV 5/26/2017 05:46:48'!
+ aDistance

	^ Meter withLength: self toMeter length + aDistance toMeter length! !

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'PV 5/26/2017 05:48:18'!
- aDistance

	^ Meter withLength: self toMeter length - aDistance toMeter length! !

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'PV 5/26/2017 05:42:44'!
= aDistance

	^ self toMeter length = aDistance toMeter length! !


!classDefinition: #Centimeter category: #Distancias!
DistanceUnit subclass: #Centimeter
	instanceVariableNames: 'length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!Centimeter methodsFor: 'initialization' stamp: 'NC 5/20/2017 13:02:31'!
initializeWithLength: aLength 
	
	length := aLength! !


!Centimeter methodsFor: 'accessing' stamp: 'NC 5/20/2017 13:03:41'!
length
	"Return the length of the distance unit"

	^ length! !


!Centimeter methodsFor: 'converting' stamp: 'NC 5/20/2017 13:05:18'!
toMeter
	"Convert this unit to meters"
	
	^ Meter withLength: length / 100! !


!Centimeter methodsFor: 'comparing' stamp: 'NC 5/20/2017 13:28:20'!
= aDistanceUnit
	"Return whether this distance unit has the same length as the other one"
	
	^ self toMeter = aDistanceUnit toMeter
! !


!Centimeter methodsFor: 'arithmetic' stamp: 'PV 5/26/2017 04:42:21'!
- aDistance
	^ Meter withLength: 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #Distancias!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 13:01:44'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !


!classDefinition: #Meter category: #Distancias!
DistanceUnit subclass: #Meter
	instanceVariableNames: 'length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!Meter methodsFor: 'initialization' stamp: 'NC 5/20/2017 12:00:19'!
initializeWithLength: aLength 
	
	length := aLength! !




!Meter methodsFor: 'accessing' stamp: 'PV 5/25/2017 16:38:27'!
length
	"Return the magnitude of the distance, in this unit."

	^ length! !


!Meter methodsFor: 'converting' stamp: 'NC 5/20/2017 13:06:11'!
toMeter
	"Convert this unit to meters"
	
	^ self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #Distancias!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 12:17:18'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !


!classDefinition: #Milimeters category: #Distancias!
DistanceUnit subclass: #Milimeters
	instanceVariableNames: 'length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!Milimeters methodsFor: 'initialization' stamp: 'NC 5/20/2017 13:24:53'!
initializeWithLength: aLength 
	
	length := aLength! !


!Milimeters methodsFor: 'converting' stamp: 'NC 5/20/2017 13:26:19'!
toMeter
	"Convert this unit to meters"
	
	^ Meter withLength: length / 1000! !


!Milimeters methodsFor: 'accessing' stamp: 'PV 5/26/2017 05:09:35'!
length
	^ length! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeters class' category: #Distancias!
Milimeters class
	instanceVariableNames: ''!

!Milimeters class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 13:24:43'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !
