!classDefinition: #TusLibrosTest category: #'TusLibros-Solution'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'aBook anotherBook newCart newCartWithFullCatalogue aCashier february2007 february2015 aCreditCard aDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:39:00'!
test01NewCartIsEmpty

	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'PV 6/13/2017 20:01:00'!
test02CartContainsBookAfterAddingIt
	
	newCart add: aBook.

	self assert: (newCart includes: aBook)! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'PV 6/15/2017 17:08:26'!
test03CountsTwoAfterAddingItTwice
	
	newCart add: aBook times: 2.

	self assert: (newCart amountOf: aBook) equals: 2! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:56:54'!
test04CantAddANegativeAmountOfABook
	
	self should: [ newCart add: aBook times: -1 ] 
		  raiseErrorThat: [ :error | 
				self assert: error messageText equals: Cart notPositiveAddErrorDescription. 
				self assert: newCart isEmpty]! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:56:57'!
test05CantAddANonIntegerAmountOfABook
		
	self should: [ newCart add: aBook times: 1.05 ] 
		  raiseErrorThat: [ :error | 
				self assert: error messageText = Cart nonIntegerAddErrorDescription.
				self assert: newCart isEmpty]! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:56:59'!
test06CantAddZeroOfABook

	self should: [ newCart add: aBook times: 0 ] 
		  raiseErrorThat: [ :error | 
				self assert: error messageText = Cart notPositiveAddErrorDescription.
				self assert: newCart isEmpty]! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 19:48:18'!
test07CartRespondsRightForItsContents

	newCartWithFullCatalogue add: aBook; add: anotherBook.
	
	self assert: newCartWithFullCatalogue contents equals: (Bag with: aBook with:anotherBook)! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:36:52'!
test08CartCantBeModifiedByChangingItsContents
	
	newCart contents add: aBook.
	
	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:57:02'!
test09CantAddToCartProductsThatDontBelongToTheCatalogue

	self should: [ newCart add: anotherBook ] 
		  raiseErrorThat: [ :error | 
				self assert: error messageText = Cart notInCatalogueErrorDescription.
				self assert: newCart isEmpty ]! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:57:04'!
test10CantCreateCartWithEmptyCatalogue
	
	| newCart |
		
	self should: [ newCart := Cart newWithCatalogue: {} ] 
		  raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cart emptyCatalogueErrorDescription.
			self assert: newCart isNil ]! !


!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/18/2017 18:55:06'!
test11CantCheckoutIfCartIsEmpty

	| resultingTicket |

	self should: [ resultingTicket := aCashier checkoutCart: newCart payingWith: aCreditCard onDate: aDate ] 
		  raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription.
			self assert: resultingTicket isNil ]
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/18/2017 18:54:48'!
test12ResultingTicketHasTheCorrectAmounts

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 2;
									add: anotherBook times: 3;
			 						add: aBook times: 3.
				
	resultingTicket := aCashier checkoutCart: newCartWithFullCatalogue payingWith: aCreditCard onDate: aDate.
				
	self assert: (resultingTicket occurrencesOf: aBook) equals: 5.
	self assert: (resultingTicket occurrencesOf: anotherBook) equals: 3.
	
	
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/18/2017 19:45:11'!
test13ResultingTicketHasTheCorrectPrices

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 1;
									add: anotherBook times: 2;
			 						add: aBook times: 3.
				
	resultingTicket := aCashier checkoutCart: newCartWithFullCatalogue payingWith: aCreditCard onDate: aDate.
				
	self assert: (resultingTicket totalCostOf: aBook) equals: 44.
	self assert: (resultingTicket totalCostOf: anotherBook) equals: 40.
	self assert: resultingTicket total equals: 84.
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/18/2017 12:58:04'!
test14CashierCantTakeEmptyPriceList

	| newCashier |

	self should: [ newCashier := Cashier newWithPriceList: Dictionary new] 
		  raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier emptyPriceListErrorDescription.
			self assert: newCashier isNil ]
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/18/2017 18:53:43'!
test15CantPayWithExpiredCreditCard

	| resultingTicket anInvalidDate |
	
	anInvalidDate := Date year: 2016 day: 1.
	newCart add: aBook .

	self should: [ resultingTicket := aCashier checkoutCart: newCart payingWith: aCreditCard onDate: anInvalidDate ] 
		  raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier expiredCreditCardErrorDescription.
			self assert: resultingTicket isNil ]
			! !


!TusLibrosTest methodsFor: '03 - Credit card' stamp: 'NC 6/18/2017 13:55:43'!
test16ValidFromDateCantHappenAfterExpirationDate
	
	| newCreditCard |
	
	self should: [ newCreditCard := CreditCard newWithValidFrom: february2015 andExpirationDate: february2007 ] 
		  raiseErrorThat: [ :error | 
			self assert: error messageText equals: CreditCard validFromMustHappenBeforeExpirationDateErrorDescription.
			self assert: newCreditCard isNil ]! !


!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/18/2017 11:56:48'!
should: aBlock raiseErrorThat: anAssertionBlock
	
	self should:aBlock
		raise: Error - MessageNotUnderstood
		withExceptionDo: anAssertionBlock! !


!TusLibrosTest methodsFor: 'setUp' stamp: 'NC 6/18/2017 18:54:17'!
setUp

	| oneItemPriceList twoItemPriceList |

	aBook := Object new.
	anotherBook := Object new.
	
	oneItemPriceList := Dictionary newFrom: { aBook->10.5 }.
	twoItemPriceList := Dictionary newFrom: { aBook->11. anotherBook->20 }.

	newCart := Cart newWithPriceList: oneItemPriceList.
	newCartWithFullCatalogue := Cart newWithPriceList: twoItemPriceList.
	
	aCashier := Cashier newWithPriceList: twoItemPriceList .
	
	february2007 := Month month: 'february' year: 2007. 
	february2015 := Month month: 'february' year: 2015.
	
	aCreditCard := CreditCard newWithValidFrom: february2007 andExpirationDate: february2015.
	
	aDate := Date year: 2010 day: 1.

	! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'products catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'accessing' stamp: 'PV 6/15/2017 19:18:04'!
contents

	^ products copy! !


!Cart methodsFor: 'adding' stamp: 'PV 6/15/2017 16:39:30'!
add: aProduct

	self add: aProduct times: 1! !

!Cart methodsFor: 'adding' stamp: 'PV 6/17/2017 15:35:50'!
add: aProduct times: aNumber

	(aNumber negative or: [ aNumber isZero ]) ifTrue: [ self error: self class notPositiveAddErrorDescription ].
	aNumber isInteger ifFalse: [ self error: self class nonIntegerAddErrorDescription ].

	(catalogue includes: aProduct) ifFalse: [ self error: self class notInCatalogueErrorDescription ].
	
	products add: aProduct withOccurrences: aNumber! !


!Cart methodsFor: 'initialization' stamp: 'PV 6/15/2017 17:56:03'!
initializeWithCatalogue: aCatalogue

	catalogue := aCatalogue.
	products := Bag new! !


!Cart methodsFor: 'testing' stamp: 'PV 6/13/2017 20:06:04'!
amountOf: aProduct

	^ products occurrencesOf: aProduct! !

!Cart methodsFor: 'testing' stamp: 'PV 6/13/2017 19:53:27'!
includes: aProduct 
	
	^ products includes: aProduct! !

!Cart methodsFor: 'testing' stamp: 'PV 6/13/2017 19:51:52'!
isEmpty

	^ products isEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/15/2017 19:56:14'!
emptyCatalogueErrorDescription

	^ 'Can''t create a cart with an empty catalogue'! !

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:45:03'!
nonIntegerAddErrorDescription

	^ 'Can''t add product to cart a non-integer number of times'! !

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/15/2017 17:50:28'!
notInCatalogueErrorDescription

	^ 'Can''t add to cart a product that doesn''t belong to the catalogue'! !

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:45:12'!
notPositiveAddErrorDescription

		^ 'Can''t add to cart a product a not positive number of times'! !


!Cart class methodsFor: 'instance creation' stamp: 'PV 6/17/2017 14:46:27'!
newWithCatalogue: aCatalogue

	aCatalogue isEmpty ifTrue: [ self error: self emptyCatalogueErrorDescription ].

	^ self new initializeWithCatalogue: aCatalogue! !

!Cart class methodsFor: 'instance creation' stamp: 'NC 6/18/2017 12:49:14'!
newWithPriceList: aPriceList

	^ self newWithCatalogue: aPriceList keys.! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'cashier operations' stamp: 'NC 6/18/2017 19:39:29'!
checkoutCart: aCart payingWith: aCreditCard onDate: aDate 

	| resultingTicket |

	aCart isEmpty ifTrue: [ self error: self class emptyCartCheckoutErrorDescription ].
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self class expiredCreditCardErrorDescription ].
	
	resultingTicket := self getTicketForCart: aCart.
	
	self debit: resultingTicket total from: aCreditCard.
	
	^ resultingTicket.
	
	
	! !

!Cashier methodsFor: 'cashier operations' stamp: 'NC 6/18/2017 19:40:24'!
debit: anAmount from: aCreditCard
	
	! !


!Cashier methodsFor: 'initialization' stamp: 'NC 6/18/2017 12:50:57'!
initializeWithPriceList: aPriceList
	
	priceList := aPriceList.! !


!Cashier methodsFor: 'private' stamp: 'NC 6/18/2017 19:39:43'!
getTicketForCart: aCart
	
	| cartContents costs |
	costs := Dictionary new.
	cartContents := aCart contents.

	cartContents asSet do: [ :product | costs at: product put: (cartContents occurrencesOf: product) * (priceList at: product ) ].
	
	^ Ticket newWithProducts: cartContents andCosts: costs.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:44:33'!
emptyCartCheckoutErrorDescription

	^ 'Can''t checkout if cart is empty'! !

!Cashier class methodsFor: 'error descriptions' stamp: 'NC 6/18/2017 12:59:29'!
emptyPriceListErrorDescription

	^ 'Can''t create a cashier with an empty price list'! !

!Cashier class methodsFor: 'error descriptions' stamp: 'NC 6/18/2017 13:36:41'!
expiredCreditCardErrorDescription

	^ 'Can''t pay with an expired credit card'! !


!Cashier class methodsFor: 'instance creation' stamp: 'NC 6/18/2017 12:59:07'!
newWithPriceList: aPriceList
	
	aPriceList isEmpty ifTrue: [ self error: self emptyPriceListErrorDescription ].
	
	^ self new initializeWithPriceList: aPriceList ! !


!classDefinition: #CreditCard category: #'TusLibros-Solution'!
Object subclass: #CreditCard
	instanceVariableNames: 'validFrom expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!CreditCard methodsFor: 'initialization' stamp: 'NC 6/18/2017 13:39:12'!
initializeWithValidFromDate: aDate andExpirationDate: anotherDate
	
	validFrom := aDate.
	expirationDate := anotherDate.! !


!CreditCard methodsFor: 'testing' stamp: 'NC 6/18/2017 18:50:29'!
isExpiredOn: aDate
	
	^ aDate < (self class dateFromMonthYear: validFrom) or: [ (self class dateFromMonthYear: expirationDate) < aDate ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros-Solution'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'error descriptions' stamp: 'NC 6/18/2017 13:56:30'!
validFromMustHappenBeforeExpirationDateErrorDescription

	^ 'Can''t create a credit card where the expiration date happens before the valid from date'! !


!CreditCard class methodsFor: 'instance creation' stamp: 'NC 6/18/2017 14:00:42'!
newWithValidFrom: aDate andExpirationDate: anotherDate
	
	(self dateFromMonthYear: aDate) < (self dateFromMonthYear: anotherDate) 
				ifFalse: [ self error: self validFromMustHappenBeforeExpirationDateErrorDescription ].
	
	^ self new initializeWithValidFromDate: aDate andExpirationDate: anotherDate.! !


!CreditCard class methodsFor: 'private' stamp: 'NC 6/18/2017 14:03:05'!
dateFromMonthYear: aMonthInAYear
	
	^ Date newDay: 1 month: aMonthInAYear name year: aMonthInAYear yearNumber.! !


!classDefinition: #Ticket category: #'TusLibros-Solution'!
Object subclass: #Ticket
	instanceVariableNames: 'ocurrences costs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Ticket methodsFor: 'accessing' stamp: 'NC 6/18/2017 19:42:32'!
total
	
	| total |
	
	total := 0.
	
	costs valuesDo: [ :anAmount | total := total + anAmount ].
	
	^ total.! !


!Ticket methodsFor: 'initialization' stamp: 'NC 6/18/2017 13:10:05'!
initializeWithProducts: aBagOfProducts andCosts: aDictionaryOfCosts.
	
	ocurrences := aBagOfProducts.
	costs := aDictionaryOfCosts.! !


!Ticket methodsFor: 'testing' stamp: 'NC 6/18/2017 13:18:31'!
occurrencesOf: aProduct
	
	^ ocurrences occurrencesOf: aProduct.! !

!Ticket methodsFor: 'testing' stamp: 'NC 6/18/2017 13:07:21'!
totalCostOf: aProduct
	
	^ costs at: aProduct! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ticket class' category: #'TusLibros-Solution'!
Ticket class
	instanceVariableNames: ''!

!Ticket class methodsFor: 'instance creation' stamp: 'NC 6/18/2017 13:09:23'!
newWithProducts: aBagOfProducts andCosts: aDictionaryOfCosts
	
	^ self new initializeWithProducts: aBagOfProducts andCosts: aDictionaryOfCosts.! !
