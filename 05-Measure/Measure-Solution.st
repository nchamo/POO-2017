!classDefinition: #Distance category: #'Measure-Solution'!
Magnitude subclass: #Distance
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Distance methodsFor: 'accessing' stamp: 'NC 6/1/2017 23:24:04'!
amount
	
	^ amount! !

!Distance methodsFor: 'accessing' stamp: 'NC 5/28/2017 17:17:35'!
unit
	
	^ unit! !


!Distance methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:26:16'!
* aMultiplier

	^ self class amount: amount * aMultiplier unit: unit! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 6/4/2017 08:20:03'!
+ aDistance

	^ self class amount: self distanceInMeters + aDistance distanceInMeters unit: DistanceUnit meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 6/4/2017 08:20:18'!
- aDistance

	^ self class amount: self distanceInMeters - aDistance distanceInMeters unit: DistanceUnit meter! !

!Distance methodsFor: 'arithmetic' stamp: 'PV 6/4/2017 08:45:02'!
/ aDividerNumber

	^ self class amount: amount / aDividerNumber unit: unit! !

!Distance methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:26:43'!
adaptToNumber: aMultiplier andSend: anOperationSymbol

	anOperationSymbol = #* ifFalse: [
		self error: 'Distance only knows how to adapt to a number when the operation is the multiplication' ].

	^ self class amount: amount * aMultiplier unit: unit.! !

!Distance methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:27:04'!
negated
	
	^ self class amount: amount negated unit: unit. ! !


!Distance methodsFor: 'comparing' stamp: 'PV 5/28/2017 12:19:56'!
< aDistance

	^ self compare: aDistance with: #<! !

!Distance methodsFor: 'comparing' stamp: 'NC 6/1/2017 19:35:33'!
= aDistance

	(aDistance isKindOf: Distance) ifFalse: [ ^ false ].   

	^ self compare: aDistance with: #=! !

!Distance methodsFor: 'comparing' stamp: 'NC 6/1/2017 20:15:56'!
hash
	
	^ self distanceInMeters hash! !


!Distance methodsFor: 'converting' stamp: 'NC 6/1/2017 23:26:52'!
convertTo: aUnit
	
	^ self class amount: (self distanceIn: aUnit) unit: aUnit.! !

!Distance methodsFor: 'converting' stamp: 'NC 6/1/2017 23:24:15'!
distanceIn: aDistanceUnit

	^ amount * unit distanceInMeters / aDistanceUnit distanceInMeters! !

!Distance methodsFor: 'converting' stamp: 'PV 6/4/2017 08:21:06'!
distanceInMeters

	^ self distanceIn: DistanceUnit meter! !


!Distance methodsFor: 'initialization' stamp: 'NC 6/1/2017 23:29:25'!
initializeWithAmount: anAmount andUnit: aUnit

	amount := anAmount.
	unit := aUnit.
	! !


!Distance methodsFor: 'printing' stamp: 'PV 6/4/2017 10:00:34'!
printString
	
	| string |

	string := amount printString , ' ' , unit printString.
	
	amount = 1 ifFalse: [ string := string, 's' ].
	
	^ string.! !


!Distance methodsFor: 'stepping' stamp: 'PV 5/28/2017 12:56:27'!
to: aDistance 

	^ DistanceInterval from: self to: aDistance ! !

!Distance methodsFor: 'stepping' stamp: 'NC 5/28/2017 18:02:13'!
to: aDistance by: anotherDistance

	^ DistanceInterval from: self to: aDistance by: anotherDistance! !

!Distance methodsFor: 'stepping' stamp: 'NC 6/1/2017 23:19:26'!
to: aDistance by: anotherDistance do: aBlock
		
	(self to: aDistance by: anotherDistance) do: aBlock
	! !



!Distance methodsFor: 'private' stamp: 'PV 5/28/2017 12:19:37'!
compare: aDistance with: anOperatorSymbol

	^ self distanceInMeters perform: anOperatorSymbol with: aDistance distanceInMeters! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Measure-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'initialization' stamp: 'NC 6/1/2017 23:29:36'!
amount: anAmount unit: aUnit
	
	^ self new initializeWithAmount: anAmount andUnit: aUnit! !


!classDefinition: #Measure category: #'Measure-Solution'!
Magnitude subclass: #Measure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'accessing' stamp: 'NC 6/1/2017 23:24:04'!
amount
	
	^ amount! !

!Measure methodsFor: 'accessing' stamp: 'NC 5/28/2017 17:17:35'!
unit
	
	^ unit! !


!Measure methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:26:16'!
* aMultiplier

	^ self class amount: amount * aMultiplier unit: unit! !

!Measure methodsFor: 'arithmetic' stamp: 'PV 6/5/2017 18:33:08'!
+ aMeasure

	unit baseUnit = aMeasure unit baseUnit ifTrue: [
		^ self class amount: self amountInBase + aMeasure amountInBase unit: unit baseUnit].
	
	^ Set newFrom: {self. aMeasure}
	
	! !

!Measure methodsFor: 'arithmetic' stamp: 'NC 6/4/2017 20:59:19'!
- aMeasure

	^ self class amount: self amountInBase - aMeasure amountInBase unit: unit baseUnit ! !

!Measure methodsFor: 'arithmetic' stamp: 'PV 6/4/2017 08:45:02'!
/ aDividerNumber

	^ self class amount: amount / aDividerNumber unit: unit! !

!Measure methodsFor: 'arithmetic' stamp: 'NC 6/4/2017 21:04:51'!
adaptToNumber: aMultiplier andSend: anOperationSymbol

	anOperationSymbol = #* ifFalse: [
		self error: 'Measure only knows how to adapt to a number when the operation is the multiplication' ].

	^ self class amount: amount * aMultiplier unit: unit.! !

!Measure methodsFor: 'arithmetic' stamp: 'NC 6/1/2017 23:27:04'!
negated
	
	^ self class amount: amount negated unit: unit. ! !


!Measure methodsFor: 'comparing' stamp: 'NC 6/4/2017 21:00:24'!
< aMeasure

	^ self compare: aMeasure with: #<! !

!Measure methodsFor: 'comparing' stamp: 'NC 6/4/2017 21:00:33'!
= aMeasure

	(aMeasure isKindOf: self class) ifFalse: [ ^ false ].   

	^ self compare: aMeasure with: #=! !

!Measure methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:52:22'!
hash
	
	^ self amountInBase hash! !


!Measure methodsFor: 'converting' stamp: 'NC 6/4/2017 21:03:49'!
amountIn: aUnit

	^ amount * unit ratioToBase / aUnit ratioToBase.! !

!Measure methodsFor: 'converting' stamp: 'NC 6/4/2017 21:04:08'!
amountInBase

	^ self amountIn: unit baseUnit ! !

!Measure methodsFor: 'converting' stamp: 'NC 6/4/2017 21:04:16'!
convertTo: aUnit
	
	^ self class amount: (self amountIn: aUnit) unit: aUnit.! !


!Measure methodsFor: 'initialization' stamp: 'NC 6/1/2017 23:29:25'!
initializeWithAmount: anAmount andUnit: aUnit

	amount := anAmount.
	unit := aUnit.
	! !


!Measure methodsFor: 'printing' stamp: 'PV 6/4/2017 10:00:34'!
printString
	
	| string |

	string := amount printString , ' ' , unit printString.
	
	amount = 1 ifFalse: [ string := string, 's' ].
	
	^ string.! !


!Measure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:01:40'!
to: aMeasure 

	^ DistanceInterval from: self to: aMeasure ! !

!Measure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:01:52'!
to: aMeasure by: anotherMeasure

	^ DistanceInterval from: self to: aMeasure by: anotherMeasure! !

!Measure methodsFor: 'stepping' stamp: 'NC 6/4/2017 21:02:01'!
to: aMeasure by: anotherMeasure do: aBlock
		
	(self to: aMeasure by: anotherMeasure) do: aBlock
	! !


!Measure methodsFor: 'private' stamp: 'PV 6/5/2017 18:06:41'!
compare: aMeasure with: anOperatorSymbol

	^ self unit baseUnit = aMeasure unit baseUnit and: [ self amountInBase perform: anOperatorSymbol with: aMeasure amountInBase ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'initialization' stamp: 'NC 6/1/2017 23:29:36'!
amount: anAmount unit: aUnit
	
	^ self new initializeWithAmount: anAmount andUnit: aUnit! !


!classDefinition: #DistanceInterval category: #'Measure-Solution'!
Collection subclass: #DistanceInterval
	instanceVariableNames: 'interval unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/4/2017 21:05:57'!
at: aPosition

	^ Measure amount: (interval at: aPosition) unit: unit.! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/1/2017 19:44:08'!
by
	
	^ (self at: 2) - (self at: 1)! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/4/2017 21:05:49'!
from
	
	^ Measure amount: interval first unit: unit! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:16:16'!
interval

	^ interval! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 5/28/2017 18:20:41'!
size
	 
	^ interval size! !

!DistanceInterval methodsFor: 'accessing' stamp: 'NC 6/4/2017 21:06:00'!
to
	
	^ Measure amount: interval last unit: unit! !

!DistanceInterval methodsFor: 'accessing' stamp: 'PV 5/30/2017 16:17:17'!
unit

	^ unit! !


!DistanceInterval methodsFor: 'adding' stamp: 'PV 6/4/2017 10:20:11'!
add: newObject 
	"Adding to a DistanceInterval is not allowed."

	self shouldNotImplement! !


!DistanceInterval methodsFor: 'comparing' stamp: 'PV 6/4/2017 10:13:20'!
= aDistanceInterval

	^ aDistanceInterval from = self from and: [aDistanceInterval to = self to] and: [aDistanceInterval by = self by]! !

!DistanceInterval methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:52:30'!
hash

	^ self from amountInBase * self to amountInBase * self by amountInBase! !


!DistanceInterval methodsFor: 'enumerating' stamp: 'NC 6/4/2017 21:05:55'!
do: aBlock

	interval do: [ :anAmount | aBlock value: (Measure amount: anAmount unit: unit) ]! !


!DistanceInterval methodsFor: 'initialization' stamp: 'NC 5/28/2017 17:19:25'!
initializeWithInterval: anInterval andUnit: aUnit
	
	interval := anInterval.
	unit := aUnit! !


!DistanceInterval methodsFor: 'removing' stamp: 'PV 6/4/2017 10:23:04'!
remove: oldObject ifAbsent: anExceptionBlock 
	"SequencableCollections, like DistanceIntervals, cannot implement removing."

	self shouldNotImplement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceInterval class' category: #'Measure-Solution'!
DistanceInterval class
	instanceVariableNames: ''!

!DistanceInterval class methodsFor: 'instance creation' stamp: 'NC 6/4/2017 21:06:07'!
from: startDistance to: stopDistance

	^ self from: startDistance to: stopDistance by: (Measure amount: 1 unit: startDistance unit)
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


!classDefinition: #CatedraDistanceTest category: #'Measure-Solution'!
TestCase subclass: #CatedraDistanceTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

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


!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:20:12'!
distanceExamples

	"¿Quién se anima a explicar cómo funciona este método? 
	¿Por qué está hecho así? "
		
	| distanceCategory distanceMessageNames |
	
	distanceCategory := self class organization categoryOfElement: thisContext method selector.
	distanceMessageNames := (self class organization listAtCategoryNamed:  distanceCategory) reject: [ :aMessageName | aMessageName = thisContext method selector ].
	
	 ^ distanceMessageNames collect: [ :aMessageName | self perform: aMessageName ]
	
! !

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

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:18'!
twoHundredCentimeters
	
	^factory twoHundredCentimeters ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:29'!
twoMeters
	
	^factory twoMeters ! !

!CatedraDistanceTest methodsFor: 'distance measures' stamp: 'HAW 5/31/2017 11:04:38'!
zeroMeters

	^factory zeroMeters ! !


!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:35'!
centimeter

	^ factory centimeter! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:43'!
decameter
	
	^ factory decameter! !

!CatedraDistanceTest methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:45'!
decimeter
	
	^ factory decimeter! !

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


!CatedraDistanceTest methodsFor: 'setup' stamp: 'NC 6/4/2017 21:14:41'!
setUp

	| factoryClass |
	
	factoryClass := Smalltalk classNamed: #MeasureFactory.
	self assert: factoryClass notNil description: 'No se entrego la clase MeasureFactory'.
	
	factory := factoryClass new.
	
	
	"Our setups"! !


!classDefinition: #DistanceTest category: #'Measure-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'oneMeter oneHundredCentimeters oneThousandMillimeters twoMeters zeroMeters zeroCentimeters ninetyCentimeters oneHundredMillimeters zeroMillimeters anotherMeter twoHundredMillimeters oneHalfMeter tenKilometers threeMeters fiveCentimeters fiftyMilimiters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

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


!DistanceTest methodsFor: 'private' stamp: 'NC 6/4/2017 21:04:25'!
equivalentIntervalFromStart: startDistance stop: stopDistance step: stepDistance

	^ Interval from: (startDistance amountIn: stepDistance unit)
		to: (stopDistance amountIn: stepDistance unit)
		by: stepDistance amount! !


!classDefinition: #MeasureTest category: #'Measure-Solution'!
DistanceTest subclass: #MeasureTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureTest methodsFor: '1 - Test equality' stamp: 'PV 6/5/2017 18:10:09'!
test01ObjectsRepresentingSameMeasureShouldBeEqual

	self assert: factory oneKilogram equals: factory oneKilogram.
	
	self assert: factory oneMeter equals: factory oneHundredCentimeters.! !

!MeasureTest methodsFor: '1 - Test equality' stamp: 'PV 6/5/2017 17:51:55'!
test02DiferentMeasuresShouldNotBeEqual

	self deny: factory oneMeter = factory twoMeters.
	self deny: factory twoMeters = factory oneMeter.
	
	self deny: factory fiftyDolars = factory fiftyPesos.! !


!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'PV 6/5/2017 17:48:22'!
test02CanAddMeasuresOfTheSameType

	"1 kilogramo + 100 gramos"
	"10 pesos - 5 centavos de peso"
	
	| oneKilogramAndOneHundredGrams ninePesosAndNinetyFivePesoCents |
	
	oneKilogramAndOneHundredGrams := Measure amount: 1 + (100/1000) unit: Unit kilogram.
	ninePesosAndNinetyFivePesoCents := Measure amount: 9 + (95/100) unit: Unit peso. 
	
	self assert: factory oneKilogram + factory oneHundredGrams equals: oneKilogramAndOneHundredGrams.
	self assert: factory tenPesos - factory fivePesoCents equals: ninePesosAndNinetyFivePesoCents.! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'PV 6/5/2017 17:17:10'!
test03CanMultiplyMeasuresByANumber

	"50 dolares * 10"

	self assert: (Measure amount: 50 unit: Unit dolar) * 10 equals: (Measure amount: 500 unit: Unit dolar).! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'PV 6/5/2017 17:34:47'!
test04CanDivideMeasuresByANumber

	"30 litros / 10"

	self assert: factory thirtyLiters / 10 equals: factory threeLiters! !

!MeasureTest methodsFor: '2 - Test arithmetic operations' stamp: 'PV 6/5/2017 18:17:37'!
test05CanAddMeasuresOfDifferentUnit

	"10 pesos + 50 dolares = 50 dolares + 10 pesos"

	self assert: factory tenPesos + factory fiftyDolars equals: factory tenPesos + factory fiftyDolars.
	
	"1 kilogramo + 30 litros = 30 litros + 1 kilogramo"
	
	self assert: factory oneKilogram + factory thirtyLiters equals: factory threeLiters + factory oneKilogram.! !


!MeasureTest methodsFor: 'setup' stamp: 'NC 6/4/2017 21:26:46'!
setUp
	
	factory := MeasureFactory new.! !


!classDefinition: #DistanceFactory category: #'Measure-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 6/4/2017 08:18:17'!
centimeters: anAmount

	^ Distance amount: anAmount unit: DistanceUnit centimeter! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 6/4/2017 08:18:09'!
kilometers: anAmount

	^ Distance amount: anAmount unit: DistanceUnit kilometer! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 6/4/2017 08:18:01'!
meters: anAmount

	^ Distance amount: anAmount unit: DistanceUnit meter! !

!DistanceFactory methodsFor: 'distance creation' stamp: 'PV 6/4/2017 08:18:28'!
millimeters: anAmount

	^ Distance amount: anAmount unit: DistanceUnit millimeter! !

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


!classDefinition: #DistanceUnit category: #'Measure-Solution'!
Object subclass: #DistanceUnit
	instanceVariableNames: 'name distanceInMeters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'NC 6/1/2017 20:48:02'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ name = anObject name and: [ distanceInMeters = anObject distanceInMeters ]! !

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'NC 6/1/2017 20:38:35'!
distanceInMeters
	
	^ distanceInMeters! !

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'NC 6/1/2017 20:41:23'!
initializeWithName: aName andDistanceInMeters: aNumber
	
	name := aName.
	distanceInMeters := aNumber.! !

!DistanceUnit methodsFor: 'as yet unclassified' stamp: 'NC 6/1/2017 20:49:03'!
printString

	^ name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnit class' category: #'Measure-Solution'!
DistanceUnit class
	instanceVariableNames: ''!

!DistanceUnit class methodsFor: 'initialization' stamp: 'NC 6/1/2017 20:40:52'!
withName: aName andDistanceInMeters: aNumber 

	^ self new initializeWithName: aName andDistanceInMeters: aNumber! !


!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:59:03'!
centimeter

	^ DistanceUnit withName: 'centimeter' andDistanceInMeters: 1/100! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:58:48'!
decameter
	
	^ DistanceUnit withName: 'decameter' andDistanceInMeters: 10! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:58:28'!
decimeter
	
	^ DistanceUnit withName: 'decimeter' andDistanceInMeters: 1/10! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:57:56'!
hectometer
	
	^ DistanceUnit withName: 'hectometer' andDistanceInMeters: 100! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:57:15'!
kilometer
	
	^ DistanceUnit withName: 'kilometer' andDistanceInMeters: 1000! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:53:36'!
meter
	
	^ DistanceUnit withName: 'meter' andDistanceInMeters: 1! !

!DistanceUnit class methodsFor: 'accessing instances and variables' stamp: 'PV 6/4/2017 07:53:34'!
millimeter

	^ (DistanceUnit withName: 'millimeter' andDistanceInMeters: 1/1000)! !


!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:18'!
centimeter

	^ Unit centimeter ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:43'!
decameter

	^ Unit decameter ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:49'!
decimeter

	^ Unit decimeter ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:31:54'!
hectometer

	^ Unit hectometer ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:00'!
kilometer

	^ Unit kilometer ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:05'!
meter

	^ Unit meter ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'NC 6/4/2017 22:32:10'!
millimeter

	^ Unit millimeter ! !


!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:22:04'!
fiftyMillimeters

	^ self millimeters: 50! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:17:22'!
fiveCentimeters

	^ self centimeters: 5! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:19:49'!
halfMeter

	^ self meters: 1/2! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:55:56'!
minusOneMeter

	^ self meters: -1! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:16:42'!
ninetyCentimeters

	^ self centimeters: 90! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:56:21'!
oneCentimeter

	^ self centimeters: 1! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:58:53'!
oneHundredCentimeters

	^ self centimeters: 100! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:04'!
oneHundredMillimeters

	^ self millimeters: 100! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:58:34'!
oneMeter

	^ self meters: 1! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:20:52'!
oneThousandMillimeters

	^ self millimeters: 1000! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:19:09'!
tenKilometers

	^ self kilometers: 10! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:20:00'!
threeMeters

	^ self meters: 3! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:10'!
twoHundredCentimeters

	^ self centimeters: 200! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:50'!
twoHundredMillimeters

	^ self millimeters: 200! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:23'!
twoMeters

	^ self meters: 2! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:17:07'!
zeroCentimeters

	^ self centimeters: 0! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'PV 5/30/2017 14:59:37'!
zeroMeters

	^ self meters: 0! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'NC 6/4/2017 21:21:14'!
zeroMillimeters

	^ self millimeters: 0! !




!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/4/2017 21:28:31'!
oneHundredGrams
	
	^ Measure amount: 100 unit: Unit gram! !

!MeasureFactory methodsFor: 'weight measures' stamp: 'NC 6/4/2017 21:29:00'!
oneKilogram
	
	^ Measure amount: 1 unit: Unit kilogram! !


!MeasureFactory methodsFor: 'private' stamp: 'NC 6/4/2017 21:06:17'!
centimeters: anAmount

	^ Measure amount: anAmount unit: Unit centimeter! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/4/2017 21:06:15'!
kilometers: anAmount

	^ Measure amount: anAmount unit: Unit kilometer! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/4/2017 21:06:11'!
meters: anAmount

	^ Measure amount: anAmount unit: Unit meter! !

!MeasureFactory methodsFor: 'private' stamp: 'NC 6/4/2017 21:06:12'!
millimeters: anAmount

	^ Measure amount: anAmount unit: Unit millimeter! !


!MeasureFactory methodsFor: 'currency measures' stamp: 'PV 6/5/2017 17:36:38'!
fiftyDolars

	^ Measure amount: 50 unit: Unit dolar ! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'PV 6/5/2017 17:55:32'!
fiftyPesos

	^ Measure amount: 50 unit: Unit peso ! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/4/2017 23:07:44'!
fivePesoCents
	
	^ Measure amount: 5 unit: Unit pesoCent! !

!MeasureFactory methodsFor: 'currency measures' stamp: 'NC 6/4/2017 23:05:55'!
tenPesos
	
	^ Measure amount: 10 unit: Unit peso! !


!MeasureFactory methodsFor: 'volume' stamp: 'PV 6/5/2017 17:33:36'!
thirtyLiters

	^ Measure amount: 30 unit: Unit liter! !

!MeasureFactory methodsFor: 'volume' stamp: 'PV 6/5/2017 17:34:13'!
threeLiters

	^ Measure amount: 3 unit: Unit liter! !


!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Unit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:53:48'!
baseUnit
	
	self subclassResponsibility ! !

!Unit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:31:46'!
ratioToBase
	
	self subclassResponsibility ! !


!Unit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:19'!
= anObject
	
	self subclassResponsibility ! !

!Unit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:33'!
hash
	
	self subclassResponsibility ! !


!Unit methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:23:56'!
initializeWithName: aName
	
	name := aName.! !


!Unit methodsFor: 'printing' stamp: 'NC 6/1/2017 20:49:03'!
printString

	^ name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unit class' category: #'Measure-Solution'!
Unit class
	instanceVariableNames: ''!

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:27:39'!
centimeter

	^ DerivedUnit withName: 'centimeter' aBaseUnit: self meter andARatio: 1/100! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:00'!
decameter
	
	^ DerivedUnit withName: 'decameter' aBaseUnit: self meter andARatio: 10! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:13'!
decimeter
	
	^ DerivedUnit withName: 'decimeter' aBaseUnit: self meter andARatio: 1/10! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:25'!
hectometer
	
	^ DerivedUnit withName: 'hectometer' aBaseUnit: self meter andARatio: 100! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:36'!
kilometer
	
	^ DerivedUnit withName: 'kilometer' aBaseUnit: self meter andARatio: 1000! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:29:05'!
meter
	
	^ BaseUnit withName: 'meter'! !

!Unit class methodsFor: 'meter and derived' stamp: 'NC 6/4/2017 20:28:50'!
millimeter

	^ DerivedUnit withName: 'millimeter' aBaseUnit: self meter andARatio: 1/1000! !


!Unit class methodsFor: 'gram and derived' stamp: 'NC 6/4/2017 20:45:30'!
gram
	
	^ BaseUnit withName: 'gram'! !

!Unit class methodsFor: 'gram and derived' stamp: 'NC 6/4/2017 20:46:08'!
kilogram
	
	^ DerivedUnit withName: 'kilogram' aBaseUnit: self gram andARatio: 1000! !


!Unit class methodsFor: 'peso and derived' stamp: 'NC 6/4/2017 23:06:36'!
peso
	
	^ BaseUnit withName: 'peso'! !

!Unit class methodsFor: 'peso and derived' stamp: 'NC 6/4/2017 23:07:12'!
pesoCent
	
	^ DerivedUnit withName: 'peso cent' aBaseUnit: self peso andARatio: 1/100! !


!Unit class methodsFor: 'as yet unclassified' stamp: 'PV 6/5/2017 17:16:26'!
dolar
	
	^ BaseUnit withName: 'dolar'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'PV 6/5/2017 17:24:25'!
liter
	
	^ BaseUnit withName: 'liter'! !


!classDefinition: #BaseUnit category: #'Measure-Solution'!
Unit subclass: #BaseUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!BaseUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:53:37'!
baseUnit
	
	^ self! !

!BaseUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:17:24'!
ratioToBase
	
	^ 1! !


!BaseUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:09:49'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ name = anObject name! !

!BaseUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:10:09'!
hash
	
	^ name hash! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BaseUnit class' category: #'Measure-Solution'!
BaseUnit class
	instanceVariableNames: ''!

!BaseUnit class methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:41:46'!
withName: aName
	
	^ self new initializeWithName: aName! !


!classDefinition: #DerivedUnit category: #'Measure-Solution'!
Unit subclass: #DerivedUnit
	instanceVariableNames: 'baseUnit ratioToBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DerivedUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:20:15'!
baseUnit
	
	^ baseUnit! !

!DerivedUnit methodsFor: 'accessing' stamp: 'NC 6/4/2017 20:17:55'!
ratioToBase
	
	^ ratioToBase ! !


!DerivedUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:19:58'!
= anObject
	
	(anObject isKindOf: self class) ifFalse: [ ^ false ].
	
	^ name = anObject name and: [ ratioToBase = anObject ratioToBase ] and: [ baseUnit = anObject baseUnit]! !

!DerivedUnit methodsFor: 'comparing' stamp: 'NC 6/4/2017 20:20:57'!
hash
	
	^ name hash * baseUnit hash * ratioToBase hash! !


!DerivedUnit methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:30:24'!
initializeWithName: aName aBaseUnit: aBaseUnit andARatio: aRatio
	
	self initializeWithName: aName.
	baseUnit := aBaseUnit.
	ratioToBase := aRatio ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DerivedUnit class' category: #'Measure-Solution'!
DerivedUnit class
	instanceVariableNames: ''!

!DerivedUnit class methodsFor: 'initialization' stamp: 'NC 6/4/2017 20:25:37'!
withName: aName aBaseUnit: aBaseUnit andARatio: aRatio
	
	^ self new initializeWithName: aName aBaseUnit: aBaseUnit andARatio: aRatio! !
