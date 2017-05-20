!classDefinition: #DistanciasTest category: #Distancias!
TestCase subclass: #DistanciasTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMilimeters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!

!DistanciasTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:15:18'!
test01DistanceUnitsOfSameTypeAndLengthAreEqual

	| anotherMeter |
	
	anotherMeter := Meter withLength: 1.
	
	self assert: oneMeter equals: anotherMeter
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:15:09'!
test02DistanceUnitsOfSameTypeCanBeAdded

	| anotherMeter twoMeters |

	anotherMeter := Meter withLength: 1.
	twoMeters := Meter withLength: 2.

	self assert: oneMeter + anotherMeter equals: twoMeters
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:22:32'!
test03OneMeterEqualsOneHundredCentimeters

	self assert: oneMeter equals: oneHundredCentimeters 
	
	! !

!DistanciasTest methodsFor: 'testing' stamp: 'NC 5/20/2017 13:30:21'!
test04OneHundredCentimetersEqualsOneThousandMilimeters

	self assert: oneHundredCentimeters equals: oneThousandMilimeters 
	
	! !


!DistanciasTest methodsFor: 'setup' stamp: 'NC 5/20/2017 13:30:14'!
setUp

	oneMeter := Meter withLength: 1.
	oneHundredCentimeters := Centimeter withLength: 100.
	oneThousandMilimeters := Milimeters withLength: 1000.! !


!classDefinition: #DistanceUnit category: #Distancias!
Object subclass: #DistanceUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancias'!




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


!Meter methodsFor: 'arithmetic' stamp: 'NC 5/20/2017 12:20:20'!
+ aDistanceUnit 

	^ self class withLength: (length + aDistanceUnit length)! !


!Meter methodsFor: 'comparing' stamp: 'NC 5/20/2017 13:04:35'!
= aDistanceUnit
	"Return whether this distance unit has the same length as the other one"
	
	^ length = aDistanceUnit toMeter length
! !


!Meter methodsFor: 'accessing' stamp: 'NC 5/20/2017 12:15:12'!
length
	"Return the length of the distance unit"

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeters class' category: #Distancias!
Milimeters class
	instanceVariableNames: ''!

!Milimeters class methodsFor: 'class initialization' stamp: 'NC 5/20/2017 13:24:43'!
withLength: aLength 
	
	^ self new initializeWithLength: aLength! !
