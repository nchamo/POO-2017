!classDefinition: #TusLibrosTest category: #'TusLibros-Solution'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'aBook anotherBook newCart newCartWithFullCatalogue aCashier aCreditCard aSalesBook aMP restInterface aFutureMonth aCardNumber'
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

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/25/2017 15:49:14'!
test04CantAddANegativeAmountOfABook
	
	self assertBlock: [ newCart add: aBook times: -1 ] FailsWithoutAddingItemToCartAndExceptionHasDescription: Cart notPositiveAddErrorDescription.! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/25/2017 15:49:41'!
test05CantAddANonIntegerAmountOfABook
		
	self assertBlock: [ newCart add: aBook times: 1.05 ] FailsWithoutAddingItemToCartAndExceptionHasDescription: Cart nonIntegerAddErrorDescription.	! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/25/2017 15:50:03'!
test06CantAddZeroOfABook

	self assertBlock: [ newCart add: aBook times: 0 ] FailsWithoutAddingItemToCartAndExceptionHasDescription: Cart notPositiveAddErrorDescription.! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/25/2017 15:46:28'!
test07CartCanReturnItsContents
	newCartWithFullCatalogue add: aBook; add: anotherBook.
	
	self assert: newCartWithFullCatalogue contents equals: (Bag with: aBook with:anotherBook)! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/18/2017 11:36:52'!
test08CartCantBeModifiedByChangingItsContents
	
	newCart contents add: aBook.
	
	self assert: newCart isEmpty! !

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/25/2017 15:50:24'!
test09CantAddToCartProductsThatDontBelongToTheCatalogue

	self assertBlock: [ newCart add: anotherBook ] FailsWithoutAddingItemToCartAndExceptionHasDescription: Cart notInPriceListErrorDescription.! !


!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/25/2017 16:48:47'!
test10CantCheckoutIfCartIsEmpty
	
	self should: [ self checkoutWithValidCreditCard: newCart ] 
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription.
			self assertSalesBookHasntChanged: aSalesBook ]! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/25/2017 16:48:53'!
test11ResultingTicketHasTheCorrectAmounts

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 2;
									add: anotherBook times: 3;
			 						add: aBook times: 3.

	resultingTicket := self checkoutWithValidCreditCard: newCartWithFullCatalogue.
				
	self assert: (resultingTicket occurrencesOf: aBook) equals: 5.
	self assert: (resultingTicket occurrencesOf: anotherBook) equals: 3.
	
	
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/25/2017 16:48:59'!
test12ResultingTicketHasTheCorrectPrices

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 1;
									add: anotherBook times: 2;
			 						add: aBook times: 3.

	resultingTicket := self checkoutWithValidCreditCard: newCartWithFullCatalogue.
				
	self assert: (resultingTicket totalCostOf: aBook) equals: 44.
	self assert: (resultingTicket totalCostOf: anotherBook) equals: 40.
	self assert: resultingTicket total equals: 84.
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/25/2017 16:37:28'!
test13CantPayWithExpiredCreditCard

	| aPastDate | 

	aPastDate := Date year: 2020 day: 1.

	newCart add: aBook.
	
	self should: [ self checkout: newCart onDate: aPastDate ] 
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier expiredCreditCardErrorDescription.
			self assertSalesBookHasntChanged: aSalesBook.
			self assertMPWasntCalled: aMP ]! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'PV 6/25/2017 20:04:03'!
test14IfCheckoutIsSuccessfulTheSalesBookShouldHaveOneMoreRegister

	| ticket |

	newCart add: aBook.
	
	ticket := self checkoutWithValidCreditCard: newCart.

	self assert: aSalesBook salesCount equals: 1.
	self assert: (aSalesBook includes: ticket)! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'PV 6/25/2017 20:17:46'!
test15MerchantProcessorErrorIsntHandledByCashier

	| mP cashier aValidDate |

	mP :=	MerchantProcessorSimulator newWithClosure: [ :card :amount | self error: MerchantProcessorSimulator defaultErrorDescription ].
	cashier := Cashier newWithSalesBook: aSalesBook andMP: mP.
	aValidDate :=  Date newDay: 15 month: 6  year: 2017.
	
	newCart add: aBook.

	self
		should: [ cashier checkoutCart: newCart payingWith: aCreditCard onDate: aValidDate ]
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: MerchantProcessorSimulator defaultErrorDescription.
			self assertSalesBookHasntChanged: aSalesBook ]! !


!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 14:20:44'!
test21NewCartRequestedByRestInterfaceIsEmpty

	| newCartId |

	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.

	self assert: (restInterface cartWithId: newCartId) isEmpty! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 14:19:59'!
test22CartContainsBookAfterAddingItThroughRestInterface
	
	| newCartId cart |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	cart := restInterface cartWithId: newCartId.
	
	restInterface addToCartWithID: newCartId andBookIsbn: aBook andQuantity: 1.

	self assert: (cart includes: aBook)! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 14:08:23'!
test23RestInterfaceRespondsRightForACartContents
	
	| newCartId cart cartContents |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	cart := restInterface cartWithId: newCartId.
	
	cartContents := restInterface listCart: newCartId.

	self assert: cartContents equals: cart contents! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 15:30:44'!
test24CantCheckoutThroughRestInterfaceIfCartIsEmpty

	| newCartId |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	
	self
		should: [ restInterface checkoutCartId: newCartId ccn: aCardNumber cced: aFutureMonth cco: 'John Doe' ]
		raiseErrorThat: [ :error | self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 15:30:58'!
test25CantCheckoutThroughRestInterfaceIfCartIsEmpty

	| newCartId |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	
	self
		should: [ restInterface checkoutCartId: newCartId ccn: aCardNumber cced: aFutureMonth cco: 'John Doe' ]
		raiseErrorThat: [ :error | self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 15:42:22'!
test26IfCheckoutThroughRestInterfaceIsSuccessfulShouldReturnATransactionId

	| newCartId cart transactionId |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	cart := restInterface cartWithId: newCartId.
	cart add: aBook.
	
	transactionId := restInterface checkoutCartId: newCartId ccn: aCardNumber cced: aFutureMonth cco: 'John Doe'.
	
	self assert: (restInterface includesTransactionId: transactionId)! !

!TusLibrosTest methodsFor: '03 - Test Interface' stamp: 'PV 6/26/2017 15:58:45'!
test27CanListPurchasesOfACustomerThroughRestInterface

	| books newCartId cart |
	
	newCartId := restInterface newCartForClientID: 1 andPassword: 'password'.
	cart := restInterface cartWithId: newCartId.
	cart add: aBook times: 3.
	restInterface checkoutCartId: newCartId ccn: aCardNumber cced: aFutureMonth cco: 'John Doe'.

	books := restInterface listAllBooksBoughtOfClientId: 1 andPassword: 'password'.
	
	"self assert: books equals: (Dictionary newFrom: {aBook -> 3})"! !


!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/25/2017 15:48:44'!
assertBlock: aBlock FailsWithoutAddingItemToCartAndExceptionHasDescription: anErrorDescription

	self should: aBlock
		  raiseErrorThat: [ :error | 
				self assert: error messageText = anErrorDescription.
				self assert: newCart isEmpty ]! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/25/2017 16:27:32'!
assertMPWasntCalled: aMerchantProcessor

	self assert: aMerchantProcessor callsCount equals: 0! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/25/2017 16:06:17'!
assertSalesBookHasntChanged: aSalesBook

	self assert: aSalesBook salesCount equals: 0! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/18/2017 11:56:48'!
should: aBlock raiseErrorThat: anAssertionBlock
	
	self should:aBlock
		raise: Error - MessageNotUnderstood
		withExceptionDo: anAssertionBlock! !


!TusLibrosTest methodsFor: 'setUp' stamp: 'PV 6/26/2017 14:42:52'!
setUp

	| oneItemPriceList aClientPassDict twoItemPriceList |

	aBook := 1234567890123.
	anotherBook := 1234567890124.
	
	oneItemPriceList := Dictionary newFrom: { aBook->10.5 }.
	twoItemPriceList := Dictionary newFrom: { aBook->11. anotherBook->20 }.

	newCart := Cart newWithPriceList: oneItemPriceList.
	newCartWithFullCatalogue := Cart newWithPriceList: twoItemPriceList.
	
	aSalesBook := SalesBook new.

	aMP := MerchantProcessorSimulator newWithClosure: [ :card :amount | true ].

	aCashier := Cashier newWithSalesBook: aSalesBook andMP: aMP.

	aFutureMonth := Month month: 'february' year: 2019.
	
	aCreditCard := CreditCard newWithExpirationDate: aFutureMonth andOwner: 'John Doe' andNumber: 0123456789012345.
	
	aClientPassDict := Dictionary newFrom: { 1 -> 'password'. 2 -> 'clave'. 3 -> 'otraClave' }.
	
	restInterface := RestInterface newWithSalesBook: aSalesBook andPriceList: twoItemPriceList andMP: aMP andClientsPasswords: aClientPassDict.
	
	aCardNumber := '0123456789012345'! !


!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/24/2017 10:12:43'!
checkout: aCart onDate: aDate

	^ aCashier checkoutCart: aCart payingWith: aCreditCard onDate: aDate! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/25/2017 16:46:48'!
checkoutWithValidCreditCard: aCart

	^ self checkout: aCart onDate: (Date newDay: 15 month: 5 year: 2017)! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'products priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'accessing' stamp: 'PV 6/15/2017 19:18:04'!
contents

	^ products copy! !

!Cart methodsFor: 'accessing' stamp: 'PV 6/24/2017 10:53:33'!
priceOf: anObject 

	^ priceList at: anObject! !


!Cart methodsFor: 'adding' stamp: 'PV 6/15/2017 16:39:30'!
add: aProduct

	self add: aProduct times: 1! !

!Cart methodsFor: 'adding' stamp: 'NC 6/25/2017 13:05:21'!
add: aProduct times: aNumber

	(aNumber negative or: [ aNumber isZero ]) ifTrue: [ self error: self class notPositiveAddErrorDescription ].	
	aNumber isInteger ifFalse: [ self error: self class nonIntegerAddErrorDescription ].
	(priceList includesKey: aProduct) ifFalse: [ self error: self class notInPriceListErrorDescription ].
	
	products add: aProduct withOccurrences: aNumber! !


!Cart methodsFor: 'initialization' stamp: 'PV 6/24/2017 10:47:32'!
initializeWithPriceList: aPriceList

	priceList := aPriceList.
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

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:45:03'!
nonIntegerAddErrorDescription

	^ 'Can''t add product to cart a non-integer number of times'! !

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/24/2017 10:49:33'!
notInPriceListErrorDescription

	^ 'Can''t add to cart a product that doesn''t belong to the price list'! !

!Cart class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:45:12'!
notPositiveAddErrorDescription

		^ 'Can''t add to cart a product a not positive number of times'! !


!Cart class methodsFor: 'instance creation' stamp: 'PV 6/24/2017 15:28:19'!
newWithPriceList: aPriceList

	^ self new initializeWithPriceList: aPriceList! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'cashier operations' stamp: 'NC 6/25/2017 16:33:21'!
checkoutCart: aCart payingWith: aCreditCard onDate: aDate 

	| resultingTicket |

	aCart isEmpty ifTrue: [ self error: self class emptyCartCheckoutErrorDescription ].
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self class expiredCreditCardErrorDescription ].
	
	resultingTicket := self getTicketForCart: aCart.
	
	merchantProcessor debit: resultingTicket total from: aCreditCard.
	
	salesBook successfulSale: resultingTicket.
	
	^ resultingTicket.
	
	
	! !


!Cashier methodsFor: 'initialization' stamp: 'NC 6/25/2017 16:33:25'!
initializeWithSalesBook: aSalesBook andMP: aMerchantProcessor 

	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor! !


!Cashier methodsFor: 'private' stamp: 'NC 6/25/2017 16:32:01'!
getTicketForCart: aCart
	
	| cartContents costs |
	
	costs := Dictionary new.
	cartContents := aCart contents.

	cartContents asSet do: [ :product | costs at: product put: (cartContents occurrencesOf: product) * (aCart priceOf: product ) ].
	
	^ Ticket newWithProducts: cartContents andCosts: costs.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'PV 6/17/2017 20:44:33'!
emptyCartCheckoutErrorDescription

	^ 'Can''t checkout if cart is empty'! !

!Cashier class methodsFor: 'error descriptions' stamp: 'NC 6/18/2017 13:36:41'!
expiredCreditCardErrorDescription

	^ 'Can''t pay with an expired credit card'! !


!Cashier class methodsFor: 'instance creation' stamp: 'PV 6/24/2017 15:42:35'!
newWithSalesBook: aSalesBook andMP: aMerchantProcessorSimulator 

	^ self new initializeWithSalesBook: aSalesBook andMP: aMerchantProcessorSimulator ! !


!classDefinition: #CreditCard category: #'TusLibros-Solution'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate ownerName number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!CreditCard methodsFor: 'initialization' stamp: 'NC 6/25/2017 13:18:34'!
initializeWithExpirationDate: aDate andOwnerName: aName andCreditCardNumber: aCreditCardNumber
	
	expirationDate := aDate.
	ownerName := aName.
	number := aCreditCardNumber.! !


!CreditCard methodsFor: 'testing' stamp: 'NC 6/25/2017 13:29:59'!
isExpiredOn: aDate
	
	^ expirationDate < aDate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros-Solution'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'NC 6/25/2017 13:20:41'!
newWithExpirationDate: aMonthInYear andOwner: aName andNumber: aNumber
	
	^ self new initializeWithExpirationDate: (self dateFromMonthYear: aMonthInYear) andOwnerName: aName andCreditCardNumber: aNumber.! !


!CreditCard class methodsFor: 'private' stamp: 'NC 6/25/2017 13:23:37'!
dateFromMonthYear: aMonthInAYear

	"Create a date for the last day of the given month"
	
	^ Date newDay: aMonthInAYear daysInMonth month: aMonthInAYear name year: aMonthInAYear yearNumber.! !


!classDefinition: #MerchantProcessorSimulator category: #'TusLibros-Solution'!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'closure callsCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!MerchantProcessorSimulator methodsFor: 'accessing' stamp: 'PV 6/24/2017 17:25:25'!
callsCount

	^ callsCount! !


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'PV 6/24/2017 16:47:33'!
initializeWithClosure: aBlockClosure 

	closure := aBlockClosure.
	callsCount := 0! !


!MerchantProcessorSimulator methodsFor: 'merchant processor operations' stamp: 'NC 6/25/2017 15:37:27'!
debit: amount from: aCreditCard

	callsCount := callsCount + 1.
	
	^ closure value: amount value: aCreditCard! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #'TusLibros-Solution'!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'error descriptions' stamp: 'PV 6/25/2017 20:16:23'!
defaultErrorDescription

	^ 'Transaction error'! !

!MerchantProcessorSimulator class methodsFor: 'error descriptions' stamp: 'PV 6/24/2017 16:14:05'!
notEnoughCreditErrorDescription

	^ 'Credit Card has not enough credit'! !

!MerchantProcessorSimulator class methodsFor: 'error descriptions' stamp: 'PV 6/24/2017 16:24:36'!
stolenCardErrorDescription

	^ 'The credit card is stolen'! !


!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'NC 6/25/2017 15:36:36'!
newWithClosure: aBlockClosure 

	^ self new initializeWithClosure: aBlockClosure ! !


!classDefinition: #RestInterface category: #'TusLibros-Solution'!
Object subclass: #RestInterface
	instanceVariableNames: 'salesBook priceList mP clientPasswords cartsIds transactionIds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/24/2017 18:57:11'!
addToCartWithID: cartId andBookIsbn: aBookIsbn andQuantity: aNumber

	(aNumber positive and: [ aNumber isInteger ]) ifFalse: [ self error: 'Quantity isn''t a positive integer' ].
	
	(cartsIds at: cartId) add: aBookIsbn times: aNumber

	! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/24/2017 18:39:37'!
cartWithId: anId 

	^ cartsIds at: anId! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/26/2017 15:39:39'!
checkoutCartId: aCartId ccn: aCardNumber cced: aMonth cco: aName 

	| newCashier cart card ticket ticketId |
	
	self toDo: 'verificar tarjeta'.
	
	newCashier := Cashier newWithSalesBook: salesBook andMP: mP.
	cart := cartsIds at: aCartId.
	card := CreditCard newWithExpirationDate: aMonth andOwner: aName andNumber: aCardNumber.
	
	ticket := newCashier checkoutCart: cart payingWith: card onDate: Date today.
	ticketId := transactionIds size.
	transactionIds add: ticketId -> ticket.
	
	^ ticketId! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/26/2017 15:42:37'!
includesTransactionId: aTransactionId 

	^ transactionIds includesKey: aTransactionId ! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/26/2017 15:54:33'!
listAllBooksBoughtOfClientId: aClientId andPassword: aPassword

	(clientPasswords includesKey: aClientId)
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
	(clientPasswords at: aClientId) = aPassword
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
		
	! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/24/2017 19:07:32'!
listCart: aCartId

	^ (cartsIds at: aCartId) contents! !

!RestInterface methodsFor: 'as yet unclassified' stamp: 'PV 6/26/2017 14:20:25'!
newCartForClientID: aClientId andPassword: aPassword

	| cart cartId |
	(clientPasswords includesKey: aClientId)
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
	(clientPasswords at: aClientId) = aPassword
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
	
	cart := Cart newWithPriceList: priceList.
	cartId := cartsIds size.
	cartsIds add: cartId -> cart.
	
	^ cartId! !


!RestInterface methodsFor: 'initialization' stamp: 'PV 6/26/2017 15:34:53'!
initializeWithWithSalesBook: aSalesBook andPriceList: aPriceList andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict

	salesBook := aSalesBook.
	priceList := aPriceList.
	mP := aMerchantProcessorSimulator.
	clientPasswords := aClientPassDict.
	cartsIds := Dictionary new.
	transactionIds := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestInterface class' category: #'TusLibros-Solution'!
RestInterface class
	instanceVariableNames: ''!

!RestInterface class methodsFor: 'as yet unclassified' stamp: 'PV 6/26/2017 14:03:52'!
invalidClientPasswordCombinationErrorDescription

	^ 'Invalida client-password combination'! !

!RestInterface class methodsFor: 'as yet unclassified' stamp: 'PV 6/24/2017 17:56:46'!
newWithSalesBook: aSalesBook andPriceList: aDictionary andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict

	^ self new initializeWithWithSalesBook: aSalesBook andPriceList: aDictionary andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict! !


!classDefinition: #SalesBook category: #'TusLibros-Solution'!
Object subclass: #SalesBook
	instanceVariableNames: 'salesCount sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!SalesBook methodsFor: 'accessing' stamp: 'PV 6/25/2017 19:58:26'!
salesCount

	^ sales size! !


!SalesBook methodsFor: 'adding' stamp: 'PV 6/25/2017 19:48:08'!
successfulSale: aTicket 

	sales add: aTicket.! !


!SalesBook methodsFor: 'initialization' stamp: 'PV 6/25/2017 19:48:21'!
initialize

	sales := Set new! !


!SalesBook methodsFor: 'testing' stamp: 'PV 6/25/2017 20:07:20'!
includes: aTicket 
	
	^ sales includes: aTicket ! !


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
