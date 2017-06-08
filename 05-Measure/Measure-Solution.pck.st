'From Cuis 5.0 of 7 November 2016 [latest update: #3086] on 8 June 2017 at 8:02:23 am'!
'Description Please enter a description for this package'!
!provides: 'Measure-Solution' 1 0!
!classDefinition: #SingleMeasure category: #'Measure-Solution'!
Magnitude subclass: #SingleMeasure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'SingleMeasure class' category: #'Measure-Solution'!
SingleMeasure class
	instanceVariableNames: ''!

!classDefinition: #DistanceInterval category: #'Measure-Solution'!
Collection subclass: #DistanceInterval
	instanceVariableNames: 'interval unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'DistanceInterval class' category: #'Measure-Solution'!
DistanceInterval class
	instanceVariableNames: ''!

!classDefinition: #CatedraDistanceTest category: #'Measure-Solution'!
TestCase subclass: #CatedraDistanceTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'CatedraDistanceTest class' category: #'Measure-Solution'!
CatedraDistanceTest class
	instanceVariableNames: ''!

!classDefinition: #DistanceTest category: #'Measure-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMillimeters twoMeters zeroMeters zeroCentimeters ninetyCentimeters oneHundredMillimeters zeroMillimeters anotherMeter twoHundredMillimeters oneHalfMeter tenKilometers threeMeters fiveCentimeters fiftyMilimiters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'DistanceTest class' category: #'Measure-Solution'!
DistanceTest class
	instanceVariableNames: ''!

!classDefinition: #MeasureTest category: #'Measure-Solution'!
TestCase subclass: #MeasureTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'MeasureTest class' category: #'Measure-Solution'!
MeasureTest class
	instanceVariableNames: ''!

!classDefinition: #CompoundMeasure category: #'Measure-Solution'!
Object subclass: #CompoundMeasure
	instanceVariableNames: 'measures'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'CompoundMeasure class' category: #'Measure-Solution'!
CompoundMeasure class
	instanceVariableNames: ''!

!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'MeasureFactory class' category: #'Measure-Solution'!
MeasureFactory class
	instanceVariableNames: ''!

!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'Unit class' category: #'Measure-Solution'!
Unit class
	instanceVariableNames: ''!

!classDefinition: #CompoundUnit category: #'Measure-Solution'!
Unit subclass: #CompoundUnit
	instanceVariableNames: 'dividend divisor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'CompoundUnit class' category: #'Measure-Solution'!
CompoundUnit class
	instanceVariableNames: ''!

!classDefinition: #EmptyUnit category: #'Measure-Solution'!
Unit subclass: #EmptyUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'EmptyUnit class' category: #'Measure-Solution'!
EmptyUnit class
	instanceVariableNames: ''!

!classDefinition: #SingleUnit category: #'Measure-Solution'!
Unit subclass: #SingleUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'SingleUnit class' category: #'Measure-Solution'!
SingleUnit class
	instanceVariableNames: ''!

!classDefinition: #BaseUnit category: #'Measure-Solution'!
SingleUnit subclass: #BaseUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'BaseUnit class' category: #'Measure-Solution'!
BaseUnit class
	instanceVariableNames: ''!

!classDefinition: #DerivedUnit category: #'Measure-Solution'!
SingleUnit subclass: #DerivedUnit
	instanceVariableNames: 'baseUnit convertToBaseBlock convertFromBaseBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
!classDefinition: 'DerivedUnit class' category: #'Measure-Solution'!
DerivedUnit class
	instanceVariableNames: ''!


!Number methodsFor: '*Measure-Solution' stamp: 'NC 6/8/2017 07:26:51'!
divideAMeasure: aMeasure
	
	^ SingleMeasure amount: aMeasure amount / self unit: aMeasure unit! !

!Number methodsFor: '*Measure-Solution' stamp: 'NC 6/8/2017 07:24:32'!
multiplyACompoundUnit: aUnit
	
	^ self * aUnit! !

!Number methodsFor: '*Measure-Solution' stamp: 'NC 6/8/2017 07:25:43'!
multiplyAMeasure: aMeasure
	
	^ self * aMeasure! !

!Number methodsFor: '*Measure-Solution' stamp: 'NC 6/8/2017 07:22:47'!
multiplyASingleUnit: aUnit
	
	^ self * aUnit! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:25:55'!
* aMultiplier

	^ aMultiplier multiplyAMeasure: self! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:28:28'!
+ aMeasure

	^ self ifSameTypeAs: aMeasure
		then: [ ^ self class amount: self amountInBase + aMeasure amountInBase unit: unit baseUnit]
		else: [ ^ CompoundMeasure with: self with: aMeasure ].
	
	! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:09:58'!
- aMeasure

	^ self + aMeasure negated
	! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:26:58'!
/ aDivisor

	^ aDivisor divideAMeasure: self
! !

!SingleMeasure methodsFor: 'comparing' stamp: 'NC 6/7/2017 01:39:41'!
< aMeasure

	^ (self unit isSameTypeAs: aMeasure unit) and: [ self amountInBase < aMeasure amountInBase ]! !

!SingleMeasure methodsFor: 'comparing' stamp: 'NC 6/8/2017 06:28:50'!
= aMeasure

	(aMeasure isKindOf: self class) ifFalse: [ ^ false ].   

	^ self ifSameTypeAs: aMeasure
		then: [ ^ self amountInBase= aMeasure amountInBase ]
		else: [ ^ self amountInBase isZero and: [ aMeasure amountInBase isZero] ]! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/4/2017 21:04:51'!
adaptToNumber: aMultiplier andSend: anOperationSymbol

	anOperationSymbol = #* ifFalse: [
		self error: 'Measure only knows how to adapt to a number when the operation is the multiplication' ].

	^ self class amount: amount * aMultiplier unit: unit.! !

!SingleMeasure methodsFor: 'accessing' stamp: 'NC 6/1/2017 23:24:04'!
amount
	
	^ amount! !

!SingleMeasure methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:19:08'!
amountIn: aUnit

	^ aUnit convertAmountFromBase: (unit convertAmountToBase: amount).! !

!SingleMeasure methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:05:47'!
amountInBase

	^ unit convertAmountToBase: amount ! !

!SingleMeasure methodsFor: 'converting' stamp: 'NC 6/7/2017 01:40:22'!
convertTo: aUnit
	
	(self unit isSameTypeAs: aUnit) 
		ifFalse: [ self error: self class wrongTypeConversionErrorMessageDescription ].
	
	^ self class amount: (self amountIn: aUnit) unit: aUnit.! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:44:13'!
divideAMeasure: aMeasure 
	
	^ self class amount: aMeasure amount / amount unit: aMeasure unit / unit! !

!SingleMeasure methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:52:22'!
hash
	
	^ self amountInBase hash! !

!SingleMeasure methodsFor: 'private' stamp: 'NC 6/8/2017 06:27:38'!
ifSameTypeAs: aMeasure then: aBlock else: anotherBlock
	
	(unit isSameTypeAs: aMeasure unit) 
		ifTrue: aBlock
		ifFalse: anotherBlock! !

!SingleMeasure methodsFor: 'initialization' stamp: 'NC 6/8/2017 05:27:15'!
initializeWithAmount: anAmount andUnit: aUnit

	amount := anAmount.
	unit := aUnit.
	! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:17:07'!
multiplyAMeasure: aMeasure
	
	^ self class amount: amount * aMeasure amount unit: unit * aMeasure unit! !

!SingleMeasure methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:27:04'!
negated
	
	^ self class amount: amount negated unit: unit. ! !

!SingleMeasure methodsFor: 'printing' stamp: 'NC 6/7/2017 01:47:29'!
printOn: aStream

	aStream nextPutAll: amount printString , ' '.
	
	amount = 1 
		ifFalse: [ aStream nextPutAll: unit printPlural ]
		ifTrue: [ aStream nextPutAll: unit printString ].! !

!SingleMeasure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:01:40'!
to: aMeasure 

	^ DistanceInterval from: self to: aMeasure ! !

!SingleMeasure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:01:52'!
to: aMeasure by: anotherMeasure

	^ DistanceInterval from: self to: aMeasure by: anotherMeasure! !

!SingleMeasure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:02:01'!
to: aMeasure by: anotherMeasure do: aBlock
		
	(self to: aMeasure by: anotherMeasure) do: aBlock
	! !

!SingleMeasure methodsFor: 'accessing' stamp: 'NC 5/28/2017 17:17:35'!
unit
	
	^ unit! !

!SingleMeasure class methodsFor: 'initialization' stamp: 'NC 6/8/2017 07:53:27'!
amount: anAmount unit: aUnit
	
	 | simplifyingResult resultingAmount resultingUnit |

	simplifyingResult := aUnit simplify.
	resultingAmount := anAmount * (simplifyingResult at: 1).	
	resultingUnit := simplifyingResult at: 2.
	
	^ resultingUnit createForAmount: resultingAmount.
	! !

!SingleMeasure class methodsFor: 'initialization' stamp: 'NC 6/8/2017 07:56:53'!
createWithoutSimplifyingWithAmount: anAmount AndUnit: aUnit
	
	^ self new initializeWithAmount: anAmount andUnit: aUnit .
	! !

!SingleMeasure class methodsFor: 'error description' stamp: 'NC 6/5/2017 20:34:07'!
wrongTypeConversionErrorMessageDescription
	
	^ 'Cant convert a measure to a unit of a different type'! !

!DistanceInterval methodsFor: 'comparing' stamp: 'PV 6/4/2017 10:13:20'!
= aDistanceInterval

	^ aDistanceInterval from = self from and: [aDistanceInterval to = self to] and: [aDistanceInterval by = self by]! !

!DistanceInterval methodsFor: 'adding' stamp: 'PV 6/4/2017 10:20:11'!
add: newObject 
	"Adding to a DistanceInterval is not allowed."

	self shouldNotImplement! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/8/2017 00:12:52'!
at: aPosition

	^ SingleMeasure amount: (interval at: aPosition) unit: unit.! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/1/2017 19:44:08'!
by
	
	^ (self at: 2) - (self at: 1)! !

!DistanceInterval methodsFor: 'enumerating' stamp: 'NC 6/8/2017 00:12:48'!
do: aBlock

	interval do: [ :anAmount | aBlock value: (SingleMeasure amount: anAmount unit: unit) ]! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/8/2017 00:12:44'!
from
	
	^ SingleMeasure amount: interval first unit: unit! !

!DistanceInterval methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:52:30'!
hash

	^ self from amountInBase * self to amountInBase * self by amountInBase! !

!DistanceInterval methodsFor: 'initialization' stamp: 'NC 5/28/2017 17:19:25'!
initializeWithInterval: anInterval andUnit: aUnit
	
	interval := anInterval.
	unit := aUnit! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:16:16'!
interval

	^ interval! !

!DistanceInterval methodsFor: 'removing' stamp: 'PV 6/4/2017 10:23:04'!
remove: oldObject ifAbsent: anExceptionBlock 
	"SequencableCollections, like DistanceIntervals, cannot implement removing."

	self shouldNotImplement! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 5/28/2017 18:20:41'!
size
	 
	^ interval size! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/8/2017 00:12:57'!
to
	
	^ SingleMeasure amount: interval last unit: unit! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:17:17'!
unit

	^ unit! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 00:13:00'!
from: startDistance to: stopDistance

	^ self from: startDistance to: stopDistance by: (SingleMeasure amount: 1 unit: startDistance unit)
! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'NC 6/4/2017 21:04:21'!
from: startDistance to: stopDistance by: stepDistance
	"unMetro to: diezKilometros by: cincoCentimetros
	from: 1 to: 10000 by: 0.05 unit: centimetros
	"
	
	| unit |

	unit := stepDistance unit.

	^ self interval:
		(Interval
			from: (startDistance amountIn: unit)
			to: (stopDistance amountIn: unit)
			by: stepDistance amount)
		unit: unit
		
! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'PV 5/30/2017 15:49:38'!
interval: anInterval unit: aDistanceUnit

	^ self new initializeWithInterval: anInterval andUnit: aDistanceUnit ! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:35'!
centimeter

	^ factory centimeter! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:43'!
decameter
	
	^ factory decameter! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:45'!
decimeter
	
	^ factory decimeter! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:20:12'!
distanceExamples

	"¿Quién se anima a explicar cómo funciona este método? 
	¿Por qué está hecho así? "
		
	| distanceCategory distanceMessageNames |
	
	distanceCategory := self class organization categoryOfElement: thisContext method selector.
	distanceMessageNames := (self class organization listAtCategoryNamed:  distanceCategory) reject: [ :aMessageName | aMessageName = thisContext method selector ].
	
	 ^ distanceMessageNames collect: [ :aMessageName | self perform: aMessageName ]
	
! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'HAW 5/31/2017 12:37:50'!
distanceUnits 

	"¿Quién se anima a explicar cómo funciona este método? 
	¿Por qué está hecho así? "
		
	| unitsCategory unitMessageNames |
	
	unitsCategory := self class organization categoryOfElement: thisContext method selector.
	unitMessageNames := (self class organization listAtCategoryNamed:  unitsCategory) reject: [ :aMessageName | aMessageName = thisContext method selector ].
	
	 ^ unitMessageNames collect: [ :aMessageName | self perform: aMessageName ]
	
! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:49'!
hectometer
	
	^ factory hectometer! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:51'!
kilometer
	
	^ factory kilometer! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:53'!
meter
	
	^ factory meter! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:56'!
millimeter
	
	^ factory millimeter! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:03:32'!
minusOneMeter 
	
	^factory minusOneMeter! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:03:45'!
oneCentimeter
	
	^factory oneCentimeter ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:03:53'!
oneHundredCentimeters
	
	^factory oneHundredCentimeters ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:03'!
oneMeter
	
	^factory oneMeter ! !

!CatedraDistanceTest methodsFor: 'setup' stamp: 'NC 6/4/2017 21:14:41'!
setUp

	| factoryClass |
	
	factoryClass := Smalltalk classNamed: #MeasureFactory.
	self assert: factoryClass notNil description: 'No se entrego la clase MeasureFactory'.
	
	factory := factoryClass new.
	
	
	"Our setups"! !

!CatedraDistanceTest methodsFor: '1 - Test equality' stamp: 'HernanWilkinson 4/18/2011 15:04'!
test01ObjectsRepresentingSameDistanceShouldBeEqual

	self assert: self oneMeter = self oneMeter.
	self assert: self oneHundredCentimeters = self oneHundredCentimeters.
	

! !

!CatedraDistanceTest methodsFor: '1 - Test equality' stamp: 'HernanWilkinson 4/18/2011 16:50'!
test02DiferentDistancesShouldNotBeEqual

	self deny: self oneMeter = self twoMeters.
	self deny: self twoMeters = self oneMeter! !

!CatedraDistanceTest methodsFor: '1 - Test equality' stamp: 'HernanWilkinson 4/18/2011 16:50'!
test03SameDistanceExpressWithDifferentUnitsShouldBeEqual

	self assert: self oneMeter = self oneHundredCentimeters.
	self assert: self twoMeters = self twoHundredCentimeters.

! !

!CatedraDistanceTest methodsFor: '1 - Test equality' stamp: 'HernanWilkinson 4/19/2011 10:28'!
test04EqualsShouldBeCommutative

	self assert: (self oneMeter = self oneHundredCentimeters and: [ self oneHundredCentimeters = self oneMeter ]).
	self assert: (self twoMeters = self twoHundredCentimeters and:  [ self twoHundredCentimeters = self twoMeters ]).

! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'PV 6/4/2017 07:53:05'!
test05UnitStringRepresentationShouldBeHumanReadable

	self assert: self meter printString = 'meter'.
	self assert: self centimeter printString = 'centimeter'.
	self assert: self decimeter printString = 'decimeter'.
	self assert: self millimeter printString = 'millimeter'.
	self assert: self decameter printString = 'decameter'.
	self assert: self hectometer printString = 'hectometer'.
	self assert: self kilometer printString = 'kilometer'.	! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'HAW 5/31/2017 11:17:17'!
test06DistanceStringRepresentationShouldBeHumanReadable

	self assert: self oneMeter printString = '1 meter'.
	self assert: self twoMeters printString = '2 meters'.
	self assert: self oneHundredCentimeters printString = '100 centimeters'.
	
! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'HernanWilkinson 4/19/2011 10:26'!
test07aDistanceAmountShouldBeTheExpectedAmount

	self assert: self oneMeter amount = 1.
	self assert: self twoMeters amount = 2.
	self assert: self oneHundredCentimeters amount = 100.
	self assert: self twoHundredCentimeters amount = 200.
! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'HernanWilkinson 4/19/2011 10:27'!
test07bDistanceUnitShouldBeTheExpectedUnit

	self assert: self oneMeter unit = self meter.
	self assert: self twoMeters unit = self meter.
	self assert: self oneHundredCentimeters unit = self centimeter.
	self assert: self twoHundredCentimeters unit = self centimeter.! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'HAW 5/31/2017 11:12:16'!
test07cDifferentDistanceUnitsShouldBeDifferent

	| units unitsSet |
	
	units := self distanceUnits.
	unitsSet := units asSet.
	
	self assert: units size equals: unitsSet size.
	self assert: (unitsSet includesAllOf: units).! !

!CatedraDistanceTest methodsFor: '2 - Converting/accesing/printing' stamp: 'HernanWilkinson 4/19/2011 10:27'!
test07dDistancesCanBeConvertedToDifferentUnits

	"A partir de los test de igualdad, se deben haber dado cuenta que debemos poder
	convertir distancias a distintas unidades... y que ademas dos distancias de distintas unidades
	pueden ser iguales... Por lo tanto Â¿por quÃ© no hacer esta caracteristica de las distancias explicita?
	Veran que luego se torna muy util
	
	Respecto de como esta escrito el test, para no tener que escribir los assert para oneMeter y oneHundredCentimeters 
	creo un array y lo recorro... Â¿Se podria escribir menos aun en este test?
	
	Y por quÃ© se asserta sobre el amount y luego la unidad y no directametne sobre la distancia completa. ej:
	self assert: (aDistance converTo: self meter) = self oneMeter
	"
	
	(Array with: self oneMeter with: self oneHundredCentimeters) do: [ :aDistance |
		self assert: (aDistance convertTo: self meter) amount = 1.
		self assert: (aDistance convertTo: self meter) unit = self meter.
		
		self assert: (aDistance convertTo: self decimeter) amount = 10.
		self assert: (aDistance convertTo: self decimeter) unit = self decimeter.
		
		self assert: (aDistance convertTo: self centimeter) amount = 100.
		self assert: (aDistance convertTo: self centimeter) unit = self centimeter.
		
		self assert: (aDistance convertTo: self millimeter) amount = 1000.
		self assert: (aDistance convertTo: self millimeter) unit = self millimeter.
	
		self assert: (aDistance convertTo: self decameter) amount = (1/10).
		self assert: (aDistance convertTo: self decameter) unit = self decameter.
		
		self assert: (aDistance convertTo: self hectometer) amount = (1/100).
		self assert: (aDistance convertTo: self hectometer) unit = self hectometer.
	
		self assert: (aDistance convertTo: self kilometer) amount = (1/1000).
		self assert: (aDistance convertTo: self kilometer) unit = self kilometer ]! !

!CatedraDistanceTest methodsFor: '3 - Test equality - implementation details' stamp: 'HernanWilkinson 4/19/2011 10:27'!
test08aComparingDistancesWithOtherObjectsShouldReturnFalse

	"El igual no debe generar ningun tipo de error por mas que se comparen objetos
	de distintos tipos
	Fijense como se crea una instancia de Object sin ningun tipo de problema... Â¿quÃ© representa?"

	self deny: self oneMeter = Object new.
	self deny: Object new = self oneMeter! !

!CatedraDistanceTest methodsFor: '3 - Test equality - implementation details' stamp: 'PV 6/4/2017 08:48:06'!
test08bDistancesThatAreEqualShouldReturnTheSameHash

	"Debido a como funcionan los diccionarios, cuando dos objetos son iguales deben
	tener el mismo hash. La inversa no es verdad"
	
	self assert: self oneMeter hash=self oneMeter hash.
	self assert: self oneMeter hash=self oneHundredCentimeters hash.

	
	
! !

!CatedraDistanceTest methodsFor: '3 - Test equality - implementation details' stamp: 'HernanWilkinson 4/19/2011 10:27'!
test08cCopiesOfTheSameDistanceShouldBeEqual

	"Dos objetos que ocupan distintas posiciones de memoria pero representan
	la misma entidad de la realidad, deben devolver true cuando se los compara por igual, puesto
	que representan la misma entidad de la realidad.
	Por lo tanto, el mensaje #= significa 'Â¿representan el mismo ente de la realidad?'
	mientras que el mensaje #== significa Â¿ocupan la misma posicion de memoria?"

	| originalOneMeter copiedOneMeter |

	"Al objeto oneMeter lo copio para asegurarme de tener uno oneMeter en otra posicion de memoria"

	originalOneMeter := self oneMeter.
	copiedOneMeter := originalOneMeter copy.

	"Me aseguro que ocupen distinta posicion de memoria"
	self deny: originalOneMeter == copiedOneMeter.

	"Ahora me aseguro que sean iguales"
	self assert: originalOneMeter = copiedOneMeter! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:34'!
test09AddingDistancesOfSameUnitShouldReturnADistanceRepresentingTheAddingDistances

	self assert: (self oneMeter + self oneMeter) = self twoMeters

! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:34'!
test10AddingDistancesOfDifferentUnitShouldReturnADistanceRepresentingTheAddingDistances

	self assert: (self oneMeter + self oneHundredCentimeters) = self twoMeters.
	self assert: (self oneMeter + self oneHundredCentimeters) = self twoHundredCentimeters.

! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:35'!
test11AddingDistancesIsCommutative

	self assert: (self oneMeter + self twoMeters)=(self twoMeters + self oneMeter)


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:35'!
test12AddingDistancesIsAssociative

	self assert: 
		((self oneMeter + self oneMeter) + self twoMeters) = 
		(self oneMeter + (self oneMeter + self twoMeters))


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:41'!
test12aAddingDistancesKeepsDistanceInmutability

	| oneMeter |
	
	oneMeter := self oneMeter.
	oneMeter + oneMeter.
	
	self assert: oneMeter = self oneMeter.
	


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:36'!
test13aNegatingADistanceNegatesItsAmount

	self assert: self oneMeter negated = self minusOneMeter.
	
! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:36'!
test13bNegatingADistanceIsReflective

	self assert: self oneMeter negated negated=self oneMeter.
	
! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:38'!
test14SubtractingDistancesOfSameUnitShouldReturnADistanceRepresentingTheSubtractedDistances

	self assert: (self twoMeters - self oneMeter) = self oneMeter.
	self assert: (self oneMeter - self oneMeter) = self zeroMeters.
	self assert: (self oneMeter - self twoMeters) = self oneMeter negated
	

	! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:40'!
test15SubtractingDistancesOfDifferentUnitShouldReturnADistanceRepresentingTheSubtractedDistances

	self assert: (self twoMeters - self oneHundredCentimeters) = self oneMeter.
	self assert: (self oneMeter - self oneHundredCentimeters) = self zeroMeters.
	self assert: (self oneHundredCentimeters - self twoMeters) = self oneMeter negated
	

	! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:40'!
test16SubtractingDistancesIsAssociative

	self assert: 
		((self twoMeters - self oneMeter) - self oneMeter) = 
		(self twoMeters - (self oneMeter + self oneMeter)).

	

	! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:41'!
test16aSubtractingDistancesKeepsDistanceInmutability

	| oneMeter |
	
	oneMeter := self oneMeter.
	oneMeter - oneMeter.
	
	self assert: oneMeter = self oneMeter.
	


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:45'!
test17aDistancesCanBeMultiplyByAnInteger

	self assert: self oneMeter * 1 = self oneMeter.
	self assert: self oneMeter * 2 = self twoMeters.
	self assert: self oneMeter * 0 = self zeroMeters.
! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HAW 5/31/2017 11:16:54'!
test17bDistancesCanBeMultiplyByAFraction

	self assert: (self oneMeter * (2/3)) amount = (2/3).
	self assert: (self twoMeters * (2/3)) amount = (2 * (2/3)).
! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HAW 5/31/2017 11:17:22'!
test17cDistancesCanBeMultiplyByAFloat

	self assert: (self oneMeter * 2.5) amount = 2.5.
	self assert: (self twoMeters * 2.5) amount = (2 * 2.5).
! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:47'!
test18MultiplicationKeepsDistanceInmutability

	| oneMeter |
	
	oneMeter := self oneMeter.
	oneMeter * 2.
	
	self assert: oneMeter = self oneMeter.
	


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:48'!
test19aDistancesCanBeDividedByAnInteger

	self assert: (self oneMeter / 1) = self oneMeter.
	self assert: (self twoMeters / 2) = self oneMeter.


! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/21/2011 17:24'!
test19bDistancesCanBeDividedByAFraction

	self assert: (self twoMeters / (1/3)) amount = 6.




! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:49'!
test19cDistancesCanBeDividedByAFloat

	self assert: (self twoMeters / 2.5) amount = (2/2.5).




! !

!CatedraDistanceTest methodsFor: '4 - Test arithmetic operations' stamp: 'HernanWilkinson 4/18/2011 15:49'!
test20DivisionKeepsDistanceInmutability

	| oneMeter |
	
	oneMeter := self oneMeter.
	oneMeter / 2.
	
	self assert: oneMeter = self oneMeter.
	


! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HAW 5/31/2017 11:19:04'!
test21DistancesProvideATotalOrder

	self assert: (self distanceExamples allSatisfy: [ :aDistance | aDistance < (aDistance + self oneMeter)])

! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HAW 5/31/2017 11:19:09'!
test22DistancesCanBeComparedWithGreaterThan

	self assert: (self distanceExamples allSatisfy: [ :aDistance | (aDistance + self oneMeter) > aDistance ])
! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HAW 5/31/2017 11:19:16'!
test23DistancesCanBeComparedWithLessThanOrEqual

	self assert: (self distanceExamples allSatisfy: [ :aDistance | aDistance <= aDistance and: [aDistance <= (aDistance + self oneMeter)]])

	
! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HAW 5/31/2017 11:19:20'!
test24DistancesCanBeComparedWithGreaterThanOrEqual

	self assert: (self distanceExamples allSatisfy: [ :aDistance | aDistance >= aDistance and: [(aDistance + self oneMeter) >= aDistance]])
! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HernanWilkinson 4/18/2011 16:13'!
test25MaxReturnsTheMaximumBetweenTwoDistances

	self assert: (self twoMeters max: self oneMeter) = self twoMeters.
	self assert: (self oneMeter max: self twoMeters) = self twoMeters.

	self assert: (self twoMeters max: self oneHundredCentimeters) = self twoMeters.
	self assert: (self oneHundredCentimeters max: self twoMeters) = self twoMeters.

	
! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HernanWilkinson 4/18/2011 16:14'!
test26MinReturnsTheMinimumBetweenTwoDistances

	self assert: (self twoMeters min: self oneMeter) = self oneMeter.
	self assert: (self oneMeter min: self twoMeters) = self oneMeter.

	self assert: (self twoMeters min: self oneHundredCentimeters) = self oneHundredCentimeters.
	self assert: (self oneHundredCentimeters min: self twoMeters) = self oneHundredCentimeters.

	
! !

!CatedraDistanceTest methodsFor: '5 - Test magnitude protocol' stamp: 'HernanWilkinson 4/18/2011 16:14'!
test27BetweenAndReturnsTrueIfADistanceIsBetweenOtherTwoDistances

	self assert: (self oneMeter between: self zeroMeters and: self twoMeters).
	self assert: (self oneHundredCentimeters between: self zeroMeters and: self twoMeters).
	
	self deny: (self twoMeters between: self zeroMeters and: self oneMeter).
	self deny: (self twoHundredCentimeters between: self zeroMeters and: self oneMeter).

! !

!CatedraDistanceTest methodsFor: '6 - Test interval protocol' stamp: 'HernanWilkinson 4/18/2011 16:16'!
test28IntervalOfDistancesCanBeCreatedBecauseTheyDefineATotalOrder

	self assert: (self oneMeter to: self twoMeters) from=self oneMeter.
	self assert: (self oneMeter to: self twoMeters) to=self twoMeters.
	self assert: (self oneMeter to: self twoMeters) by=self oneMeter.	

	self assert: (self oneHundredCentimeters to: self twoMeters) from=self oneMeter.
	self assert: (self oneHundredCentimeters to: self twoMeters) to=self twoMeters.
	self assert: (self oneHundredCentimeters to: self twoMeters) by=self oneCentimeter.	
	! !

!CatedraDistanceTest methodsFor: '6 - Test interval protocol' stamp: 'HernanWilkinson 4/18/2011 16:16'!
test29DistanceIntervalStepCanBeAnyDistance

	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) from=self zeroMeters.
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) to=(self twoMeters * 2).
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) by=self twoMeters.

	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) from=(self twoMeters * 2).
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) to=self zeroMeters.
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) by=self twoMeters negated

	! !

!CatedraDistanceTest methodsFor: '6 - Test interval protocol' stamp: 'HernanWilkinson 4/18/2011 16:17'!
test30DistanceIntervalSizeReturnsTheNumberOfDistancesOfTheInterval

	self assert: (self zeroMeters to: (self twoMeters * 2) ) size =5.
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self oneMeter negated) size =5.
! !

!CatedraDistanceTest methodsFor: '6 - Test interval protocol' stamp: 'HernanWilkinson 4/18/2011 16:19'!
test31DistanceIntervalCanBeEnumeratedUsingDo

	| value |
	
	value := 1.
	(self oneMeter to: (self oneMeter * 10)) do: [ :aDistance |
		self assert: aDistance amount = value.
		value := value + 1 ].
	
	self assert: value = 11
! !

!CatedraDistanceTest methodsFor: '6 - Test interval protocol' stamp: 'HernanWilkinson 4/18/2011 16:27'!
test32DistanceIntervalCanBeEnumeratedWithSpecificStep

	| value initialDistance byDistance finalDistance |
	
	initialDistance := self oneMeter.
	byDistance := self twoMeters.
	finalDistance := initialDistance * 9.
	value := initialDistance amount.
		
	(initialDistance to: finalDistance by:  byDistance) do: [ :aDistance |
		self assert: aDistance amount = value.
		value := value + byDistance amount ].
	
	self assert:  value = (finalDistance amount + byDistance amount)
! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:18'!
twoHundredCentimeters
	
	^factory twoHundredCentimeters ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:29'!
twoMeters
	
	^factory twoMeters ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:38'!
zeroMeters

	^factory zeroMeters ! !

!DistanceTest methodsFor: 'private' stamp: 'NC 6/4/2017 21:04:25'!
equivalentIntervalFromStart: startDistance stop: stopDistance step: stepDistance

	^ Interval from: (startDistance amountIn: stepDistance unit)
		to: (stopDistance amountIn: stepDistance unit)
		by: stepDistance amount! !

!DistanceTest methodsFor: 'setup' stamp: 'NC 6/4/2017 21:22:17'!
setUp

	| factory |

	factory := MeasureFactory new.

	oneMeter :=  factory oneMeter.
	anotherMeter := factory oneMeter.
	twoMeters := factory twoMeters.
	zeroMeters := factory zeroMeters.
	oneHalfMeter := factory halfMeter.
	threeMeters := factory threeMeters.

	oneHundredCentimeters := factory oneHundredCentimeters.
	zeroCentimeters := factory zeroCentimeters.
	ninetyCentimeters := factory ninetyCentimeters.
	fiveCentimeters := factory fiveCentimeters.

	oneThousandMillimeters := factory oneThousandMillimeters.
	oneHundredMillimeters := factory oneHundredMillimeters.
	zeroMillimeters := factory zeroMillimeters.
	twoHundredMillimeters := factory twoHundredMillimeters.
	fiftyMilimiters := factory fiftyMillimeters.

	tenKilometers := factory tenKilometers.! !

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

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 08:27:26'!
test04OneHundredCentimetersEqualsOneThousandMillimeters

	self assert: oneHundredCentimeters equals: oneThousandMillimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 08:27:49'!
test05TwoMetersMinusOneHundredCentimetersEqualsOneThousandMillimeters
	"dosMetros - cienCentimetros = milMilimetros"

	self assert: twoMeters - oneHundredCentimeters equals: oneThousandMillimeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 08:28:02'!
test06OneThousandMillimetersEqualsOneHoundredCentimeters

	self assert: oneThousandMillimeters equals: oneHundredCentimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 08:28:20'!
test07OneMeterMinusOneMeterEqualsZeroMillimeters

	self assert: oneMeter - oneMeter equals: zeroMillimeters ! !

!DistanceTest methodsFor: 'testing' stamp: 'NC 5/30/2017 18:42:44'!
test08OneMeterPlusOneHundrerCentimeterEqualsTwoMeters

	self assert: oneMeter + oneHundredCentimeters equals: twoMeters! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 08:30:44'!
test09OneHoundredMillimetersPlusOneHundredMillimetersEqualsTwoHundrerMillimeters

	self assert: oneHundredMillimeters + oneHundredMillimeters equals: twoHundredMillimeters! !

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

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 09:28:26'!
test14IntervalWithByIsCorrect
	"unMetro to: diezKilometros by: cincoCentimetros <-- representa un intervalo que va de un metro a diez kilometors cada cinco centimetros"

	| aDistanceInterval |

	aDistanceInterval := oneMeter to: tenKilometers by: fiveCentimeters.
	
	self assert: (aDistanceInterval at:1) equals: oneMeter.
	self assert: (aDistanceInterval at: 2) equals: oneMeter + fiveCentimeters.
	self assert: (aDistanceInterval at: 3) equals: oneMeter + (2 * fiveCentimeters).
	self assert: (aDistanceInterval at: aDistanceInterval size) equals: tenKilometers.
	
	self assert: aDistanceInterval size equals:
		(self equivalentIntervalFromStart: oneMeter stop: tenKilometers step: fiveCentimeters) size.! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 10:07:36'!
test15IntervalIterationWorks
	"unMetro to: diezKilometros by: cincoCentimetros do:[...] <-- permite recorrer el intervalo"

	| count distanceInterval | 

	count := 0.
	
	oneMeter to: tenKilometers by: fiveCentimeters do: [ :aDistance | count := count + 1].	
	self assert: count equals:
		(self equivalentIntervalFromStart: oneMeter stop: tenKilometers step: fiveCentimeters) size.
	
	distanceInterval := zeroMeters to: oneMeter by: fiveCentimeters.
	distanceInterval do: [ :aDistance | distanceInterval includes: aDistance ].! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 10:15:26'!
test16TwoIntervalsWithSameIntervalAndDifferentDefinitionAreEqual

	self assert: (zeroMeters to: oneMeter by: fiveCentimeters) equals: (zeroMeters to: oneHundredCentimeters by: fiftyMilimiters)! !

!DistanceTest methodsFor: 'testing' stamp: 'PV 6/4/2017 10:17:56'!
test17TwoEqualIntervalHaveEqualHash

	self assert: (zeroMeters to: oneMeter by: fiveCentimeters) hash equals: (zeroMeters to: oneHundredCentimeters by: fiftyMilimiters) hash! !

!MeasureTest methodsFor: 'setup' stamp: 'NC 6/4/2017 21:26:46'!
setUp
	
	factory := MeasureFactory new.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/8/2017 05:52:03'!
test01ObjectsRepresentingSameMeasureShouldBeEqual

	self assert: factory oneKilogram equals: factory oneKilogram.
	self assert: factory oneMeter equals: factory oneHundredCentimeters.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/8/2017 05:52:23'!
test02DifferentMeasuresOfTheSameTypeShouldNotBeEqual

	self deny: factory oneMeter = factory twoMeters.
	self deny: factory twoMeters = factory oneMeter.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/5/2017 20:44:30'!
test03MeasuresOfDifferentTypesShouldNotBeEqual
	
	"10 pesos = 20 dollares --> da falso, no error
	10 kilos = 20 litros --> da falso, no error"
	
	self deny: factory tenKilometers = factory thirtyLiters.
	self deny: factory fiftyDolars = factory fiftyPesos.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/5/2017 20:58:23'!
test04MeasuresOfTheSameTypeAreEqualWhenAmountIsZero
	
	self assert: factory zeroMeters = factory zeroMillimeters.
	self assert: factory zeroKilograms = factory zeroGrams.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/5/2017 21:08:36'!
test05MeasuresOfTheDifferentTypeAreEqualWhenAmountIsZero
	
	"0 metros = 0 pesos
	0 pesos = 0 litros"
	
	self assert: factory zeroMeters equals: factory zeroPesos.
	self assert: factory zeroPesos equals: factory zeroLiters.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/8/2017 05:53:02'!
test05TemperatureMeasuresAreNotEqualWhenAmountIsZero
	
	"0 kelvin !!=  0 Fahrenheit 
	 0 kelvin !!=  0 centigrados"
	
	self deny: factory zeroKelvin = factory zeroCelsius. 
	self deny: factory zeroKelvin = factory zeroFahrenheits.
	self deny: factory zeroCelsius = factory zeroFahrenheits.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/8/2017 05:53:39'!
test06CompoundMeasuresCanBeSimplifiedToSingleMeasures
	
	" 2 kilometros * segundo / metro = 2000 segundos"
	
	self assert: 2 * factory kilometer * factory second / factory meter equals: 2000 * factory second.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'NC 6/8/2017 05:53:55'!
test07CompoundMeasuresCanBeSimplifiedToNumbers
	
	"2 kilometros / 2 metros = 2000" 
	
	self assert: 2 * factory kilometer/ factory meter equals: 2000! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:54:07'!
test08CanAddMeasuresOfTheSameType

	"1 kilogramo + 100 gramos"
	"10 pesos - 5 centavos de peso"
	
	| oneKilogramAndOneHundredGrams ninePesosAndNinetyFivePesoCents |
	
	oneKilogramAndOneHundredGrams := SingleMeasure amount: 1 + (100/1000) unit: Unit kilogram.
	ninePesosAndNinetyFivePesoCents := SingleMeasure amount: 9 + (95/100) unit: Unit peso. 
	
	self assert: factory oneKilogram + factory oneHundredGrams equals: oneKilogramAndOneHundredGrams.
	self assert: factory tenPesos - factory fivePesoCents equals: ninePesosAndNinetyFivePesoCents.! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:54:31'!
test09CanMultiplyMeasuresByANumber

	"50 dolares * 10 =  500 dolares"

	self assert: (SingleMeasure amount: 50 unit: Unit dolar) * 10 equals: (SingleMeasure amount: 500 unit: Unit dolar).! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:54:42'!
test10CanDivideMeasuresByANumber

	"30 litros / 10 =  3 litros"

	self assert: factory thirtyLiters / 10 equals: factory threeLiters! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:54:47'!
test11CanAddMeasuresOfDifferentUnit

	"10 pesos + 50 dolares = 50 dolares + 10 pesos"

	self assert: factory tenPesos + factory fiftyDolars equals: factory tenPesos + factory fiftyDolars.
	
	"1 kilogramo + 30 litros = 30 litros + 1 kilogramo"
	
	self assert: factory oneKilogram + factory thirtyLiters equals: factory thirtyLiters + factory oneKilogram.! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:54:59'!
test12CanCreateAMeasureByMultipliyingANumberAndUnit

	"10*metro --> devuelve una medida que representa 10 metros"
	
	self assert: 10 * factory meter equals: factory tenMeters.
	self assert: factory meter * 10 equals: factory tenMeters.
	
	"5*kilogramo -> devuelve 5 kilogramos"

	self assert: 5 * factory kilogram equals: factory fiveKilograms.
	self assert: factory kilogram * 5 equals: factory fiveKilograms.! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 05:57:52'!
test13SameTypeMeasuresAreAddedInCompoundMeasures

	| tenPesos tenDolars twoSeconds | 
	
	tenPesos := 10 * factory peso.
	tenDolars := 10 * factory dolar.
	twoSeconds  := 2 * factory second.
	
	"10 pesos - 10 dolares + 10 pesos  = 20 pesos - 10 dolares "
	
	self assert: tenPesos - tenDolars + tenPesos equals: 20 * factory peso - tenDolars.
	
	"10 pesos - 10 dolares - 2 segundos  = - 2 segundos - 10 dolares + 10 pesos"
	
	self assert: tenPesos - tenDolars - twoSeconds equals: twoSeconds negated - tenDolars + tenPesos.! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'NC 6/8/2017 07:45:03'!
test14MeasuresWithCompoundUnitsCanDevideEachOther

	| speed acceleration |
	
	speed := 2 * factory meter / factory second.
	acceleration := 5 * factory meter / (factory second * factory second).
	
	self assert: speed / acceleration equals: 2 / 5 * factory second.! !

!MeasureTest methodsFor: '3 - Test converting' stamp: 'NC 6/8/2017 07:45:08'!
test15CanConvertAUnitToAnotherOfTheSameType

	"unkilogramo convertTo: gramo"
	
	| convertedKilogram convergetGrams |
	
	convertedKilogram := factory oneKilogram convertTo: Unit gram.
	convergetGrams := 1000 * Unit gram convertTo: factory kilogram.

	self assert: convertedKilogram unit equals: Unit gram.
	self assert: convertedKilogram amount equals: 1000.
	
	self assert: convergetGrams unit equals: Unit kilogram.
	self assert: convergetGrams amount equals: 1.! !

!MeasureTest methodsFor: '3 - Test converting' stamp: 'NC 6/8/2017 07:45:14'!
test16CantConvertAUnitToAnotherOfDifferentType

	"diezPesos convertoTo: metro --> error"
	
	self should: [ factory tenPesos convertTo: Unit meter. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: SingleMeasure wrongTypeConversionErrorMessageDescription ]
	
	! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:19'!
test17CanCreateCompoundMeasures

	| speedMeasure  |

	"10 metros/segundo (velocidad)"
	
	speedMeasure := 10 * (factory meter / factory second).
	
	self assert: speedMeasure amount equals: 10.
	self assert: speedMeasure printString equals: '10 meter / second'.
	
	"50 metros/(segundo*segundo) (aceleracion)"
	! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:24'!
test18CompoundMeasuresCanBeAdded

	| tenMetersPerSecond fiveHundredMetersPerSecond fiveHundredTenMetersPerSecond |

	"(10 metros/segundo) + ((50 metros/(segundo*segundo))*10 segundo)
	= (10 metros/segundo) + (500 metros/segundo) = 510 metros/segundo"
	
	tenMetersPerSecond := 10 * (factory meter / factory second).
	fiveHundredMetersPerSecond := (50 * factory meter / (factory second * factory second)) * 10 * factory second.
	fiveHundredTenMetersPerSecond := 510 * (factory meter / factory second).
	
	self assert: tenMetersPerSecond + fiveHundredMetersPerSecond equals: fiveHundredTenMetersPerSecond.
	! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:30'!
test19CompoundMeasuresCanBeCompared

	"3.6 kilometers/hour es igual a 1 metro/segundo"

	| threePointSixKilometersPerHour oneMeterPerSecond |
	
	threePointSixKilometersPerHour := 36/10 * factory kilometer / factory hour.
	oneMeterPerSecond := 1 * factory meter / factory second. 
	
	self assert: threePointSixKilometersPerHour equals: oneMeterPerSecond.
	! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:35'!
test20CompoundMeasuresCanBeSimplifiedAndPrinted
	
	self assert: (10 * factory meter * factory hour / factory meter) printString equals: '10 hours'.
! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:41'!
test21CompoundUnitsAreAssociative

	| speed acceleration |
	
	speed := factory meter / factory second.
	acceleration := factory meter / (factory second * factory second).
	
	self assert: 10 * speed equals: speed * 10.
	self assert: 10 * factory kilometer / factory hour equals: 10 * (factory kilometer / factory hour).
	self assert: 10 * factory kilometer * factory hour equals: 10 * (factory kilometer * factory hour).
	self assert: 10 * factory kilometer * speed equals: 10 * (factory kilometer * speed).
	self assert: 10 * speed * factory kilometer equals: 10 * (speed * factory kilometer).
	self assert: 10 * factory kilometer / speed equals: 10 * (factory kilometer / speed).
	self assert: 10 * speed / factory kilometer equals: 10 * (speed / factory kilometer).
	self assert: 10 * speed * acceleration equals: 10 * (speed * acceleration).	
	self assert: 10 * speed / acceleration equals: 10 * (speed / acceleration).		
	! !

!MeasureTest methodsFor: '4 - Test compound' stamp: 'NC 6/8/2017 07:45:50'!
test22CompoundMeasuresHaveOrder

	| speed acceleration time aNewSpeed |
	
	speed := 2 * factory meter / factory second.
	acceleration := 5 * factory meter / (factory second * factory second).
	time := factory second * 10.
	
	aNewSpeed := factory finalSpeedStartingAt: speed accelerating: acceleration during: time.
	
	self assert: aNewSpeed < (aNewSpeed + speed).! !

!CompoundMeasure methodsFor: 'arithmetic' stamp: 'NC 6/7/2017 23:51:47'!
+ aMeasure
	
	^ CompoundMeasure withCompoundMeasure: self andAdder: aMeasure
	 ! !

!CompoundMeasure methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 00:10:46'!
- aMeasure
	
	^ self + aMeasure negated
	 ! !

!CompoundMeasure methodsFor: 'comparing' stamp: 'NC 6/7/2017 23:36:38'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ measures = anObject measures! !

!CompoundMeasure methodsFor: 'comparing' stamp: 'NC 6/7/2017 23:37:01'!
hash
	
	^ measures hash! !

!CompoundMeasure methodsFor: 'initialization' stamp: 'NC 6/7/2017 23:35:18'!
initializeWith: aBagOfMeasures
	
	measures := Dictionary new.
	
	aBagOfMeasures do: [ :aMeasure | measures at: aMeasure unit baseUnit put: aMeasure amountInBase ]! !

!CompoundMeasure methodsFor: 'initialization' stamp: 'NC 6/7/2017 23:53:27'!
initializeWithCompoundMeasure: aCompoundMeasure andAdder: aMeasure
	
	| baseUnit beforeValue |
	
	baseUnit := aMeasure unit baseUnit.
	
	measures := aCompoundMeasure measures.
	measures at: baseUnit ifPresent: [ :value | beforeValue := value  ] ifAbsent: [ beforeValue := 0].
	measures at: baseUnit put: beforeValue + aMeasure amountInBase! !

!CompoundMeasure methodsFor: 'accessing' stamp: 'NC 6/7/2017 23:36:48'!
measures
	
	^ measures! !

!CompoundMeasure methodsFor: 'printing' stamp: 'NC 6/8/2017 00:07:12'!
printOn: aStream

	measures keysAndValuesDo: [ :unit :amount | amount > 0 ifTrue: [ aStream nextPutAll: ' + ' ]. aStream nextPutAll: unit printString,'  ', amount printString ]! !

!CompoundMeasure class methodsFor: 'as yet unclassified' stamp: 'NC 6/7/2017 23:52:24'!
with: aMeasure with: anotherMeasure
	
	^ self new initializeWith: (Bag with: aMeasure with: anotherMeasure).! !

!CompoundMeasure class methodsFor: 'as yet unclassified' stamp: 'NC 6/7/2017 23:52:44'!
withCompoundMeasure: aCompoundMeasure andAdder: aMeasure

	^ self new initializeWithCompoundMeasure: aCompoundMeasure andAdder: aMeasure! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'Nc 6/7/2017 03:35:46'!
celsius
	
	^ Unit celsius! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:18'!
centimeter

	^ Unit centimeter ! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/8/2017 00:14:14'!
centimeters: anAmount

	^ SingleMeasure amount: anAmount unit: Unit centimeter! !

!MeasureFactory methodsFor: 'time units' stamp: 'NC 6/7/2017 01:52:50'!
day

	^ Unit day ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:43'!
decameter

	^ Unit decameter ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:49'!
decimeter

	^ Unit decimeter ! !

!MeasureFactory methodsFor: 'currency units' stamp: 'Nc 6/7/2017 23:23:44'!
dolar

	^ Unit dolar ! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:35'!
eightCubicMeters

	^ SingleMeasure amount: 8 unit: self meter * self meter * self meter! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'NC 6/7/2017 01:50:51'!
fahrenheit
	
	^ Unit fahrenheit! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/8/2017 00:14:10'!
fiftyDolars

	^ SingleMeasure amount: 50 unit: Unit dolar ! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:22:04'!
fiftyMillimeters

	^ self millimeters: 50! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/8/2017 00:13:46'!
fiftyPesos

	^ SingleMeasure amount: 50 unit: Unit peso ! !

!MeasureFactory methodsFor: 'speed method' stamp: 'NC 6/7/2017 02:12:43'!
finalSpeedStartingAt: aSpeed accelerating: anAcceleration during: aMeasureOfTime
	
	"vf = vi + a * t "
	
	^ aSpeed + (anAcceleration * aMeasureOfTime).! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:17:22'!
fiveCentimeters

	^ self centimeters: 5! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/8/2017 00:13:50'!
fiveKilograms
	
	^ SingleMeasure amount: 5 unit: Unit kilogram! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/8/2017 00:13:49'!
fivePesoCents
	
	^ SingleMeasure amount: 5 unit: Unit pesoCent! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:12'!
fourSquaredMeters 

	^ SingleMeasure amount: 4 unit: self meter * self meter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:19:49'!
halfMeter

	^ self meters: 1/2! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:54'!
hectometer

	^ Unit hectometer ! !

!MeasureFactory methodsFor: 'time units' stamp: 'NC 6/6/2017 21:13:41'!
hour

	^ Unit hour ! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'NC 6/7/2017 01:50:56'!
kelvin
	
	^ Unit kelvin! !

!MeasureFactory methodsFor: 'weight units' stamp: 'NC 6/5/2017 21:30:48'!
kilogram

	^ Unit kilogram ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:00'!
kilometer

	^ Unit kilometer ! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/8/2017 00:13:58'!
kilometers: anAmount

	^ SingleMeasure amount: anAmount unit: Unit kilometer! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:05'!
meter

	^ Unit meter ! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/8/2017 00:13:55'!
meters: anAmount

	^ SingleMeasure amount: anAmount unit: Unit meter! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:10'!
millimeter

	^ Unit millimeter ! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/8/2017 00:14:17'!
millimeters: anAmount

	^ SingleMeasure amount: anAmount unit: Unit millimeter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:55:56'!
minusOneMeter

	^ self meters: -1! !

!MeasureFactory methodsFor: 'time units' stamp: 'NC 6/7/2017 01:52:58'!
minute

	^ Unit minute ! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:16:42'!
ninetyCentimeters

	^ self centimeters: 90! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:14:41'!
oneCelsius

	^ SingleMeasure amount: 1 unit: self celcius! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:56:21'!
oneCentimeter

	^ self centimeters: 1! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:23'!
oneDay

	^ SingleMeasure amount: 1 unit: self day! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:13:41'!
oneHour

	^ SingleMeasure amount: 1 unit: self hour! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:58:53'!
oneHundredCentimeters

	^ self centimeters: 100! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/8/2017 00:14:52'!
oneHundredGrams
	
	^ SingleMeasure amount: 100 unit: Unit gram! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:04'!
oneHundredMillimeters

	^ self millimeters: 100! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:13:56'!
oneHundredTwentyOneMetersPerSecond

	^ SingleMeasure amount: 121 unit: self meter / self second! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/8/2017 00:14:46'!
oneKilogram
	
	^ SingleMeasure amount: 1 unit: Unit kilogram! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:58:34'!
oneMeter

	^ self meters: 1! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:54'!
oneMeterPerSecond

	^ SingleMeasure amount: 1 unit: self meter / self second! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:43'!
oneMinute

	^ SingleMeasure amount: 1 unit: self minute! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:48'!
oneSecond 

	^ SingleMeasure amount: 1 unit: self second! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:13:43'!
oneSquaredMeter 

	^ SingleMeasure amount: 1 unit: self meter * self meter! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:03'!
oneSquaredSecond 

	^ SingleMeasure amount: 1 unit: self second * self second! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:20:52'!
oneThousandMillimeters

	^ self millimeters: 1000! !

!MeasureFactory methodsFor: 'currency units' stamp: 'Nc 6/7/2017 23:23:22'!
peso

	^ Unit peso ! !

!MeasureFactory methodsFor: 'time units' stamp: 'NC 6/5/2017 22:05:00'!
second

	^ Unit second ! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:39'!
sixtyMinutes

	^ SingleMeasure amount: 60 unit: self minute! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:19'!
sixtyOneSeconds 

	^ SingleMeasure amount: 61 unit: self second! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:25'!
sixtySeconds 

	^ SingleMeasure amount: 60 unit: self second! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:19:09'!
tenKilometers

	^ self kilometers: 10! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/5/2017 21:30:20'!
tenMeters

	^ self meters: 10! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/8/2017 00:13:52'!
tenPesos
	
	^ SingleMeasure amount: 10 unit: Unit peso! !

!MeasureFactory methodsFor: 'volume measures' stamp: 'NC 6/8/2017 00:14:30'!
thirtyLiters

	^ SingleMeasure amount: 30 unit: Unit liter! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:14:33'!
thirtyTwoFahrenheits 

	^ SingleMeasure amount: 32 unit: self fahrenheit ! !

!MeasureFactory methodsFor: 'volume measures' stamp: 'NC 6/8/2017 00:14:01'!
threeLiters

	^ SingleMeasure amount: 3 unit: Unit liter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:20:00'!
threeMeters

	^ self meters: 3! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:37'!
twentyFourHours 

	^ SingleMeasure amount: 24 unit: self hour! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:13:59'!
twoCelsius

	^ SingleMeasure amount: 2 unit: self celcius! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:10'!
twoHundredCentimeters

	^ self centimeters: 200! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:50'!
twoHundredMillimeters

	^ self millimeters: 200! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:23'!
twoMeters

	^ self meters: 2! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:06'!
twoMetersBySecond  

	^ SingleMeasure amount: 2 unit: self meter / self second! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:50'!
twoMetersPerSquaredSecond

	^ SingleMeasure amount: 2 unit: self meter / (self second * self second)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'NC 6/8/2017 00:14:27'!
twoMetersTimesSecond

	^ SingleMeasure amount: 2 unit: self meter * self second! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:45'!
twoSeconds 

	^ SingleMeasure amount: 2 unit: self second! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:14:34'!
zeroCelsius

	^ SingleMeasure amount: 0 unit: self celsius! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:17:07'!
zeroCentimeters

	^ self centimeters: 0! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:14:16'!
zeroFahrenheits 

	^ SingleMeasure amount: 0 unit: self fahrenheit ! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/8/2017 00:13:45'!
zeroGrams
	
	^ SingleMeasure amount: 0 unit: Unit gram! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'NC 6/8/2017 00:13:39'!
zeroKelvin

	^ SingleMeasure amount: 0 unit: self kelvin! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/8/2017 00:14:21'!
zeroKilograms
	
	^ SingleMeasure amount: 0 unit: Unit kilogram! !

!MeasureFactory methodsFor: 'volume measures' stamp: 'NC 6/8/2017 00:14:07'!
zeroLiters

	^ SingleMeasure amount: 0 unit: Unit liter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:37'!
zeroMeters

	^ self meters: 0! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:14'!
zeroMillimeters

	^ self millimeters: 0! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/8/2017 00:13:37'!
zeroPesos
	
	^ SingleMeasure amount: 0 unit: Unit peso! !

!MeasureFactory methodsFor: 'time measures' stamp: 'NC 6/8/2017 00:14:28'!
zeroSeconds 

	^ SingleMeasure amount: 0 unit: self second! !

!Unit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:02:06'!
* aMultiplier

	self subclassResponsibility ! !

!Unit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:01:08'!
/ aUnit

	self subclassResponsibility ! !

!Unit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:19'!
= anObject
	
	self subclassResponsibility ! !

!Unit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 00:14:56'!
adaptToNumber: aMultiplier andSend: anOperationSymbol

	anOperationSymbol = #* ifFalse: [
		self error: 'Units only knows how to adapt to a number when the operation is the multiplication' ].

	^ SingleMeasure amount: aMultiplier unit: self! !

!Unit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:53:48'!
baseUnit
	
	self subclassResponsibility ! !

!Unit methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:17:44'!
convertAmountFromBase: anAmount
	
	self subclassResponsibility ! !

!Unit methodsFor: 'converting' stamp: 'NC 6/7/2017 02:43:23'!
convertAmountToBase: anAmount
	
	self subclassResponsibility ! !

!Unit methodsFor: 'measure initialization' stamp: 'NC 6/8/2017 07:50:55'!
createForAmount: anAmount

	self subclassResponsibility 
	
	! !

!Unit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:25:36'!
divideAMeasure: aMeasure
	
	^ aMeasure class amount: aMeasure amount unit: aMeasure unit / self! !

!Unit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:33'!
hash
	
	self subclassResponsibility ! !

!Unit methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:23:56'!
initializeWithName: aName
	
	name := aName.! !

!Unit methodsFor: 'testing' stamp: 'NC 6/7/2017 01:40:59'!
isSameTypeAs: aUnit
	
	^ self baseUnit = aUnit baseUnit! !

!Unit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:17:23'!
multiplyAMeasure: aMeasure
	
	^ aMeasure class amount: aMeasure amount unit: aMeasure unit * self! !

!Unit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:44:45'!
printOn: aStream

	self subclassResponsibility ! !

!Unit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:14:48'!
printPlural

	self subclassResponsibility ! !

!Unit methodsFor: 'converting' stamp: 'Nc 6/7/2017 18:45:14'!
simplify
	
	self subclassResponsibility ! !

!Unit class methodsFor: 'kelvin and derived' stamp: 'Nc 6/7/2017 03:39:00'!
celsius
	
	^ DerivedUnit withName: 'celsius' aBaseUnit: self kelvin 
 		aConvertToBaseBlock: [ :anAmount | anAmount + 273.1515 ] 
		andAConvertFromBaseBlock: [ :anAmount | anAmount - 273.15 ].! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:27:39'!
centimeter

	^ DerivedUnit withName: 'centimeter' aBaseUnit: self meter andARatio: 1/100! !

!Unit class methodsFor: 'second and derived' stamp: 'NC 6/7/2017 01:54:04'!
day
	
	^ DerivedUnit withName: 'day' aBaseUnit: self second andARatio: 3600 * 24! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:00'!
decameter
	
	^ DerivedUnit withName: 'decameter' aBaseUnit: self meter andARatio: 10! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:13'!
decimeter
	
	^ DerivedUnit withName: 'decimeter' aBaseUnit: self meter andARatio: 1/10! !

!Unit class methodsFor: 'dolar and derived' stamp: 'PV 6/5/2017 17:16:26'!
dolar
	
	^ BaseUnit withName: 'dolar'! !

!Unit class methodsFor: 'kelvin and derived' stamp: 'Nc 6/7/2017 03:46:17'!
fahrenheit
	
	^ DerivedUnit withName: 'fahrenheit' aBaseUnit: self kelvin 
 		aConvertToBaseBlock: [ :anAmount | 5/9 * (anAmount - 32) + 273 ] 
		andAConvertFromBaseBlock: [ :anAmount | 9/5 * (anAmount - 273)  + 32 ].! !

!Unit class methodsFor: 'gram and derived' stamp: 'NC 6/4/2017 20:45:30'!
gram
	
	^ BaseUnit withName: 'gram'! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:25'!
hectometer
	
	^ DerivedUnit withName: 'hectometer' aBaseUnit: self meter andARatio: 100! !

!Unit class methodsFor: 'second and derived' stamp: 'NC 6/6/2017 23:04:00'!
hour
	
	^ DerivedUnit withName: 'hour' aBaseUnit: self second andARatio: 3600! !

!Unit class methodsFor: 'kelvin and derived' stamp: 'NC 6/7/2017 01:54:48'!
kelvin
	
	^ BaseUnit withName: 'kelvin'! !

!Unit class methodsFor: 'gram and derived' stamp: 'NC 6/4/2017 20:46:08'!
kilogram
	
	^ DerivedUnit withName: 'kilogram' aBaseUnit: self gram andARatio: 1000! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:36'!
kilometer
	
	^ DerivedUnit withName: 'kilometer' aBaseUnit: self meter andARatio: 1000! !

!Unit class methodsFor: 'liter and derived' stamp: 'PV 6/5/2017 17:24:25'!
liter
	
	^ BaseUnit withName: 'liter'! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:29:05'!
meter
	
	^ BaseUnit withName: 'meter'! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:50'!
millimeter

	^ DerivedUnit withName: 'millimeter' aBaseUnit: self meter andARatio: 1/1000! !

!Unit class methodsFor: 'second and derived' stamp: 'NC 6/7/2017 01:54:24'!
minute
	
	^ DerivedUnit withName: 'minute' aBaseUnit: self second andARatio: 60! !

!Unit class methodsFor: 'peso and derived' stamp: 'NC 6/4/2017 23:06:36'!
peso
	
	^ BaseUnit withName: 'peso'! !

!Unit class methodsFor: 'peso and derived' stamp: 'NC 6/4/2017 23:07:12'!
pesoCent
	
	^ DerivedUnit withName: 'peso cent' aBaseUnit: self peso andARatio: 1/100! !

!Unit class methodsFor: 'second and derived' stamp: 'NC 6/6/2017 21:16:29'!
second
	
	^ BaseUnit withName: 'second'! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:24:49'!
* aMultiplier
		
	^ aMultiplier multiplyACompoundUnit: self! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:00:48'!
/ aUnit

	^ aUnit divideACompoundUnit: self! !

!CompoundUnit methodsFor: 'comparing' stamp: 'NC 6/6/2017 20:28:07'!
= unit
	
	(unit isKindOf: CompoundUnit) ifFalse: [ ^ false ].
	
	^ unit dividend = dividend and: [ unit divisor = divisor ]! !

!CompoundUnit methodsFor: 'accessing' stamp: 'NC 6/8/2017 05:35:55'!
baseUnit
	
	| newDividend newDivisor |
	
	newDividend := dividend collect: [ :each | each baseUnit ].
	newDivisor := divisor collect: [ :each | each baseUnit ].	
	
	^ (CompoundUnit withDividendBag: newDividend andDivisorBag: newDivisor) simplify at: 2! !

!CompoundUnit methodsFor: 'converting' stamp: 'NC 6/8/2017 06:02:19'!
convertAmountFromBase: anAmount
	
	| dividendRatio divisorRatio |
	
	dividendRatio := 1.
	divisorRatio := 1.
	
	dividend do: [ :each | dividendRatio := dividendRatio * each convertAmountFromBase: anAmount ].
	divisor do: [ :each | divisorRatio := divisorRatio * each convertAmountFromBase: anAmount ].	
	
	^ dividendRatio / divisorRatio * anAmount! !

!CompoundUnit methodsFor: 'converting' stamp: 'NC 6/8/2017 05:44:39'!
convertAmountToBase: anAmount
	
	| dividendRatio divisorRatio |
	
	dividendRatio := 1.
	divisorRatio := 1.
	
	dividend do: [ :each | dividendRatio := dividendRatio * (each convertAmountToBase: anAmount) ].
	divisor do: [ :each | divisorRatio := divisorRatio * (each convertAmountToBase: anAmount) ].	
	
	^ dividendRatio / divisorRatio * anAmount ! !

!CompoundUnit methodsFor: 'measure initialization' stamp: 'NC 6/8/2017 07:57:24'!
createForAmount: anAmount

	^ SingleMeasure createWithoutSimplifyingWithAmount: anAmount AndUnit: self
	
	! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:59:17'!
divideACompoundUnit: aUnit
	
	^ CompoundUnit withCompoundUnit: aUnit andCompoundDivisor: self! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:46:23'!
divideASingleUnit: aUnit
	
	^ CompoundUnit withSingleUnit: aUnit andCompoundDivisor: self! !

!CompoundUnit methodsFor: 'accessing' stamp: 'NC 6/6/2017 19:49:09'!
dividend
	
	^ dividend! !

!CompoundUnit methodsFor: 'accessing' stamp: 'NC 6/6/2017 19:49:15'!
divisor
	
	^ divisor! !

!CompoundUnit methodsFor: 'comparing' stamp: 'NC 6/6/2017 23:58:20'!
hash
	
	^ dividend hash / divisor hash! !

!CompoundUnit methodsFor: 'initialization' stamp: 'NC 6/8/2017 05:17:41'!
initializeWithDividend: dividendBag andDivisor: divisorBag
	
	dividend := dividendBag.
	divisor := divisorBag.! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:02:50'!
multiplyACompoundUnit: aUnit
	
	^ CompoundUnit withCompoundUnit: aUnit andCompoundMultiplier: self
	! !

!CompoundUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:49:37'!
multiplyASingleUnit: aUnit
	
	^ CompoundUnit withSingleUnit: aUnit andCompoundMultiplier: self 
	! !

!CompoundUnit methodsFor: 'private' stamp: 'NC 6/7/2017 01:20:59'!
printBag: aBag

	aBag size = 1
		ifTrue: [ ^ aBag anyOne printString ]
		ifFalse:  [ ^ '(', ('*' join: aBag), ')' ].

	! !

!CompoundUnit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:46:37'!
printOn: aStream
	 
	divisor size isZero
		ifTrue: [ aStream nextPutAll: (self printBag: dividend) ] 
		ifFalse: [ aStream nextPutAll: ((self printBag: dividend), ' / ', (self printBag: divisor)) ]

	! !

!CompoundUnit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:18:18'!
printPlural
	 
	^ self printString

	! !

!CompoundUnit methodsFor: 'converting' stamp: 'NC 6/8/2017 06:02:47'!
simplify
	
	| newDividend newDivisor factor oneMatchingUnit |
	
	newDividend := dividend copy.
	newDivisor := divisor copy.	
	factor := 1.
	
	dividend do: [ :dividendUnit | (newDivisor select: [ :divisorUnit | divisorUnit isSameTypeAs: dividendUnit ]) 
										ifNotEmpty: [ :matchingUnits | 
											oneMatchingUnit := matchingUnits anyOne.
											newDividend remove: dividendUnit. 
											newDivisor remove: oneMatchingUnit.
											factor := factor * (dividendUnit convertAmountToBase: 1) / (oneMatchingUnit convertAmountToBase: 1) ] ].
	
	^ Array with: factor with: (CompoundUnit withDividendBag: newDividend andDivisorBag: newDivisor)! !

!CompoundUnit class methodsFor: 'private' stamp: 'NC 6/7/2017 00:02:44'!
bagWithAll: aBag and: aNewItem

	| newBag |

	newBag := Bag withAll: aBag.
	newBag add: aNewItem.
	^ newBag.! !

!CompoundUnit class methodsFor: 'private' stamp: 'NC 6/8/2017 07:05:06'!
bagWithAll: aBag andAll: anotherBag

	| newBag |

	newBag := Bag withAll: aBag.
	newBag addAll: anotherBag.
	^ newBag.! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:58:39'!
withCompoundUnit: unit andCompoundDivisor: aDivisorUnit
	
	^ self withDividendBag: (self bagWithAll: unit dividend andAll: aDivisorUnit divisor) andDivisorBag: (self bagWithAll: unit divisor andAll: aDivisorUnit dividend) 
		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:51:46'!
withCompoundUnit: unit andCompoundMultiplier: aMultiplierUnit
	
	^ self withDividendBag: (self bagWithAll: unit dividend andAll: aMultiplierUnit dividend) andDivisorBag: (self bagWithAll: unit divisor andAll: aMultiplierUnit divisor)
		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:51:57'!
withCompoundUnit: unit andSingleDivisor: aDivisorUnit
	
	^ self withDividendBag: unit dividend andDivisorBag: (self bagWithAll: unit divisor and: aDivisorUnit)
		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:52:05'!
withCompoundUnit: unit andSingleMultiplier: aMultiplierUnit
	
	^ self withDividendBag: (self bagWithAll: unit dividend and: aMultiplierUnit) andDivisorBag: unit divisor
		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 05:30:19'!
withDividendBag: aDividendBag andDivisorBag: aDivisorBag
	
	(aDividendBag size = 0 and: [ aDivisorBag size = 0 ]) ifTrue: [ ^ EmptyUnit new ].
	(aDividendBag size = 1 and: [ aDivisorBag size = 0 ]) ifTrue: [ ^ aDividendBag anyOne ].
		
	^ self new initializeWithDividend: aDividendBag andDivisor: aDivisorBag ! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:34:31'!
withSingleUnit: unit andCompoundDivisor: aDivisorUnit
	
	 ^ self withDividendBag: (self bagWithAll: aDivisorUnit divisor and: unit) andDivisorBag: aDivisorUnit dividend		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:47:28'!
withSingleUnit: unit andCompoundMultiplier: aMultiplierUnit
	
	^ self withDividendBag: (self bagWithAll: aMultiplierUnit dividend  and: unit) andDivisorBag: aMultiplierUnit divisor
		
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 07:04:31'!
withSingleUnit: unit andSingleDivisor: aDivisorUnit
	
	^ self withDividendBag: (Bag with: unit) andDivisorBag: (Bag with: aDivisorUnit)
	
	! !

!CompoundUnit class methodsFor: 'instance creation' stamp: 'NC 6/8/2017 06:47:48'!
withSingleUnit: unit andSingleMultiplier: aMultiplierUnit
	
	^ self withDividendBag: (Bag with: unit with: aMultiplierUnit ) andDivisorBag: Bag new 
	
	! !

!EmptyUnit methodsFor: 'measure initialization' stamp: 'NC 6/8/2017 07:48:59'!
createForAmount: anAmount
	
	^ anAmount! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:23:00'!
* aMultiplier

	^ aMultiplier multiplyASingleUnit: self ! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:46:32'!
/ aUnit

	^ aUnit divideASingleUnit: self! !

!SingleUnit methodsFor: 'measure initialization' stamp: 'NC 6/8/2017 07:57:17'!
createForAmount: anAmount

	^ SingleMeasure createWithoutSimplifyingWithAmount: anAmount AndUnit: self
	
	! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:00:35'!
divideACompoundUnit: aUnit
	
	^ CompoundUnit withCompoundUnit: aUnit andSingleDivisor: self ! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:45:19'!
divideASingleUnit: aUnit
	
	^ CompoundUnit withSingleUnit: aUnit andSingleDivisor: self! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 07:02:30'!
multiplyACompoundUnit: aUnit
	
	^ CompoundUnit withCompoundUnit: aUnit andSingleMultiplier: self! !

!SingleUnit methodsFor: 'arithmetic' stamp: 'NC 6/8/2017 06:48:31'!
multiplyASingleUnit: aUnit
	
	^ CompoundUnit withSingleUnit: aUnit andSingleMultiplier: self ! !

!SingleUnit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:45:30'!
printOn: aStream

	aStream nextPutAll: name! !

!SingleUnit methodsFor: 'printing' stamp: 'NC 6/7/2017 01:14:59'!
printPlural

	^ self printString, 's'! !

!SingleUnit methodsFor: 'converting' stamp: 'NC 6/8/2017 05:03:28'!
simplify
	
	^ Array with: 1 with: self! !

!BaseUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:09:49'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ name = anObject name! !

!BaseUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:53:37'!
baseUnit
	
	^ self! !

!BaseUnit methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:17:53'!
convertAmountFromBase: anAmount
	
	^ anAmount! !

!BaseUnit methodsFor: 'converting' stamp: 'NC 6/7/2017 02:43:57'!
convertAmountToBase: anAmount
	
	^ anAmount! !

!BaseUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:09'!
hash
	
	^ name hash! !

!BaseUnit class methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:41:46'!
withName: aName
	
	^ self new initializeWithName: aName! !

!DerivedUnit methodsFor: 'comparing' stamp: 'NC 6/7/2017 02:55:57'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ name = anObject name and: [ (self convertAmountToBase: 1) = (anObject convertAmountToBase: 1) ] and: [ baseUnit isSameTypeAs: anObject ]! !

!DerivedUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:20:15'!
baseUnit
	
	^ baseUnit! !

!DerivedUnit methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:18:11'!
convertAmountFromBase: anAmount
	
	^ convertFromBaseBlock value: anAmount! !

!DerivedUnit methodsFor: 'converting' stamp: 'Nc 6/7/2017 03:18:32'!
convertAmountToBase: anAmount
	
	^ convertToBaseBlock value: anAmount! !

!DerivedUnit methodsFor: 'comparing' stamp: 'Nc 6/7/2017 03:20:53'!
hash
	
	^ name hash * baseUnit hash * (convertToBaseBlock value: 1) hash! !

!DerivedUnit methodsFor: 'initialization' stamp: 'Nc 6/7/2017 03:15:22'!
initializeWithName: aName aBaseUnit: aBaseUnit aConvertToBlock: aBlock andAConvertFromBlock: anotherBlock
	
	self initializeWithName: aName.
	baseUnit := aBaseUnit.
	convertToBaseBlock := aBlock. 
	convertFromBaseBlock := anotherBlock.! !

!DerivedUnit class methodsFor: 'initialization' stamp: 'Nc 6/7/2017 03:38:38'!
withName: aName aBaseUnit: aBaseUnit aConvertToBaseBlock: aBlock andAConvertFromBaseBlock: anotherBlock
	
	^ self new initializeWithName: aName aBaseUnit: aBaseUnit aConvertToBlock: aBlock andAConvertFromBlock: anotherBlock! !

!DerivedUnit class methodsFor: 'initialization' stamp: 'Nc 6/7/2017 03:38:51'!
withName: aName aBaseUnit: aBaseUnit andARatio: aRatio
	
	^ self withName: aName aBaseUnit: aBaseUnit aConvertToBaseBlock: [ :anAmount | aRatio * anAmount ] andAConvertFromBaseBlock: [ :anAmount |  anAmount / aRatio ]! !
