!classDefinition: #TusLibrosTest category: #'TusLibros-Solution'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'aBook anotherBook newCart newCartWithFullCatalogue aCashier aCreditCard aSalesBook aMP restInterface feb2019 feb2018 eleven elevenTwenty elevenForty firstFeb2018 aClient invalidClientAndPassword notInPriceListBook twelve anErrorMP restInterfaceWithErrorMP'
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

!TusLibrosTest methodsFor: '01 - Cart' stamp: 'NC 6/26/2017 17:18:15'!
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


!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 19:19:19'!
test10CantCheckoutIfCartIsEmpty
	
	self should: [ self cashierCheckoutWithValidCreditCard: newCart ] 
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription.
			self assertSalesBookHasntChanged: aSalesBook ]! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 19:19:22'!
test11ResultingTicketHasTheCorrectAmounts

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 2;
									add: anotherBook times: 3;
			 						add: aBook times: 3.

	resultingTicket := self cashierCheckoutWithValidCreditCard: newCartWithFullCatalogue.
				
	self assert: (resultingTicket occurrencesOf: aBook) equals: 5.
	self assert: (resultingTicket occurrencesOf: anotherBook) equals: 3.
	
	
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 21:10:10'!
test12ResultingTicketHasTheCorrectTotal

	| resultingTicket |

	newCartWithFullCatalogue 	add: aBook times: 1;
									add: anotherBook times: 2;
			 						add: aBook times: 3.

	resultingTicket := self cashierCheckoutWithValidCreditCard: newCartWithFullCatalogue.
				
	self assert: resultingTicket total equals: 84.
			! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 19:19:05'!
test13CantPayWithExpiredCreditCard

	| aPastDate | 

	aPastDate := Date year: 2020 day: 1.

	newCart add: aBook.
	
	self should: [ self cashierCheckout: newCart onDate: aPastDate ] 
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: Cashier expiredCreditCardErrorDescription.
			self assertSalesBookHasntChanged: aSalesBook.
			self assertMPWasntCalled: aMP ]! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 20:36:22'!
test14IfCheckoutIsSuccessfulTheSalesBookShouldHaveOneMoreRegister

	| ticket |

	newCart add: aBook.
	
	ticket := self cashierCheckoutWithValidCreditCard: newCart.

	self assert: aSalesBook salesCount equals: 1.
	self assert: ((aSalesBook clientTickets: aClient) includes: ticket)! !

!TusLibrosTest methodsFor: '02 - Cashier' stamp: 'NC 6/26/2017 20:42:43'!
test15MerchantProcessorErrorIsntHandledByCashier

	| mP cashier aValidDate |

	mP :=	MerchantProcessorSimulator newWithClosure: [ :card :amount | self error: 'This is a description error' ].
	cashier := Cashier newWithSalesBook: aSalesBook andMP: mP.
	aValidDate :=  Date newDay: 15 month: 6  year: 2017.
	
	newCart add: aBook.

	self
		should: [ cashier checkoutCart: newCart byClient: aClient payingWith: aCreditCard onDate: aValidDate ]
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: 'This is a description error'.
			self assertSalesBookHasntChanged: aSalesBook ]! !


!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:50:49'!
test16UnknownUserCantCreateACartOrListPurchases

	self should: [ self createCartFor: invalidClientAndPassword ] 
		raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface invalidClientPasswordCombinationErrorDescription].
	
	self should: [ self listPurchasesFor: invalidClientAndPassword ] 
		raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface invalidClientPasswordCombinationErrorDescription]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:50:57'!
test17NewCartRequestedByRestInterfaceIsEmpty

	| newCartId |

	newCartId := self createCart.

	self assert: (self listCart: newCartId) isEmpty! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:51:25'!
test18CartContainsBookAfterAddingItThroughRestInterface
	
	| newCartId cartContents |
	
	newCartId := self createCart.
	
	self addToCart: newCartId andBookIsbn: aBook andQuantity: 5.
	self addToCart: newCartId andBookIsbn: anotherBook andQuantity: 6.

	cartContents := self listCart: newCartId.

	self assert: (cartContents occurrencesOf: aBook) equals: 5.
	self assert: (cartContents occurrencesOf: anotherBook) equals: 6.! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:51:51'!
test19CantOperateWithUnknownCartId
	
	| unknownCartId |
	
	unknownCartId := 1000.
	
	self should: [ self addToCart: unknownCartId andBookIsbn: aBook andQuantity: 1. ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface unknownCartIdErrorDescription ].
		
	self should: [ self listCart: unknownCartId ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface unknownCartIdErrorDescription ].
		
	self should: [ self checkoutCart: unknownCartId ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface unknownCartIdErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:00'!
test20AddingQuantityMustBeAPositiveInteger
	
	| newCartId |
	
	newCartId := self createCart.
	
	self should: [ self addToCart: newCartId andBookIsbn: aBook andQuantity: 1.05. ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: Cart nonIntegerAddErrorDescription ];
		
		  should: [ self addToCart: newCartId andBookIsbn: aBook andQuantity: -1. ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: Cart notPositiveAddErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:08'!
test21CantAddBookThatIsNotInThePriceList
	
	| newCartId |
	
	newCartId := self createCart.
	
	self should: [ self addToCart: newCartId andBookIsbn: notInPriceListBook andQuantity: 1 ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: Cart notInPriceListErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:24'!
test22CantCheckoutThroughRestInterfaceIfCartIsEmpty

	| newCartId |
	
	newCartId := self createCart.
	
	self should: [ self checkoutCart: newCartId ]
		  raiseErrorThat: [ :error | self assert: error messageText equals: Cashier emptyCartCheckoutErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:33'!
test23CantCheckoutWithExpiredCreditCard

	| newCartId aFutureDate |
	
	aFutureDate := Date year: 3000 day: 1.
	newCartId := self createCartOnDate: aFutureDate andTime: eleven.
	
	self addToCart: newCartId andBookIsbn: aBook andQuantity: 1 onDate: aFutureDate andTime: eleven.
	
	self should: [ self checkoutCart: newCartId onDate: aFutureDate andTime: eleven ]
		"checkoutCart:onDate:andTime uses a card with exp date feb2019"
		  raiseErrorThat: [ :error | self assert: error messageText equals: Cashier expiredCreditCardErrorDescription ]! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:40'!
test24CartExpiresAfter30Min

	| newCartId |
	
	newCartId := self createCartOnDate: firstFeb2018 andTime: eleven.
	
	self should: [ self addToCart: newCartId andBookIsbn: aBook andQuantity: 1 onDate: firstFeb2018 andTime: elevenForty ]
		  raiseErrorThat: [ :error | self assert: error messageText equals: RestInterface cartExpiredErrorDescription ].
		
	self should: [ restInterface listCart: newCartId onDate: firstFeb2018 andTime: elevenForty ]
		  raiseErrorThat: [ :error | self assert: error messageText equals: RestInterface cartExpiredErrorDescription ].
	
	self should: [ self checkoutCart: newCartId onDate: firstFeb2018 andTime: elevenForty ]
		  raiseErrorThat: [ :error | self assert: error messageText equals: RestInterface cartExpiredErrorDescription ]	
		
		
		
		! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:47'!
test25CanUseCartIfLastActivityIsWithinLast30Minutes

	| newCartId |

	newCartId := self createCart.

	self addToCart: newCartId andBookIsbn: aBook andQuantity: 1 onDate: firstFeb2018 andTime: elevenTwenty.

	restInterface listCart: newCartId onDate: firstFeb2018 andTime: elevenForty.

	self checkoutCart: newCartId onDate: firstFeb2018 andTime:  twelve.! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:52:56'!
test26CantUseCartAfterCheckout

	| newCartId |
	
	newCartId := self createCart.
	
	self addToCart: newCartId andBookIsbn: aBook andQuantity: 1.

	self checkoutCart: newCartId.
	
	self should: [ self addToCart: newCartId andBookIsbn: aBook andQuantity: 1. ] 
		  raiseErrorThat: [ :anError | self assert: anError messageText equals: RestInterface unknownCartIdErrorDescription ].! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 16:53:04'!
test27CheckoutingCartCreatesRecordInSalesBook

	| cartId1 cartId2 ticket |
	
	cartId1 := self createCart.
	self addToCart: cartId1 andBookIsbn: aBook andQuantity: 1.
	self addToCart: cartId1 andBookIsbn: anotherBook andQuantity: 3.
	self checkoutCart: cartId1.
	
	cartId2 := self createCart.
	self addToCart: cartId2 andBookIsbn: aBook andQuantity: 4.
	self checkoutCart: cartId2.
	
	ticket := restInterface listPurchasesClientId: 1 andPassword: 'password'.
	
	self assert: (ticket occurrencesOf: aBook) equals: 5.
	self assert: (ticket occurrencesOf: anotherBook) equals: 3.
	self assert: ticket total equals: 115.
	! !

!TusLibrosTest methodsFor: '03 - Rest Interface' stamp: 'PV 6/27/2017 17:17:59'!
test28MerchantProcessorErrorIsntHandledByRestInterface

	| newCartId |	

	newCartId := restInterfaceWithErrorMP createCartForClientID: 1 andPassword: 'password' onDate: firstFeb2018 andTime: eleven.

	restInterfaceWithErrorMP addToCartWithID: newCartId andBookIsbn: aBook andQuantity: 1 onDate: firstFeb2018 andTime: eleven.

	self
		should: [ self checkoutCart: newCartId withRestInterface: restInterfaceWithErrorMP ]
		raiseErrorThat: [ :error | 
			self assert: error messageText equals: 'This is a description error'.
			self assertSalesBookHasntChanged: aSalesBook ]! !


!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/25/2017 15:48:44'!
assertBlock: aBlock FailsWithoutAddingItemToCartAndExceptionHasDescription: anErrorDescription

	self should: aBlock
		  raiseErrorThat: [ :error | 
				self assert: error messageText = anErrorDescription.
				self assert: newCart isEmpty ]! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'NC 6/25/2017 16:27:32'!
assertMPWasntCalled: aMerchantProcessor

	self assert: aMerchantProcessor callsCount equals: 0! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'PV 6/27/2017 17:07:59'!
assertSalesBookHasntChanged: aSalesBook

	self assert: aSalesBook salesCount equals: 0! !

!TusLibrosTest methodsFor: 'asserting' stamp: 'PV 6/27/2017 15:09:45'!
should: aBlock raiseErrorThat: anAssertionBlock
	
	self should:aBlock
		raise: Error - MessageNotUnderstood
		withExceptionDo: anAssertionBlock! !


!TusLibrosTest methodsFor: 'setUp' stamp: 'PV 6/27/2017 16:33:44'!
setUp

	| oneItemPriceList aClientPassDict twoItemPriceList |

	aBook := 1234567890123.
	anotherBook := 1234567890124.
	notInPriceListBook := 101010100110101.
	
	oneItemPriceList := Dictionary newFrom: { aBook->10.5 }.
	twoItemPriceList := Dictionary newFrom: { aBook->11. anotherBook->20 }.

	newCart := Cart newWithPriceList: oneItemPriceList.
	newCartWithFullCatalogue := Cart newWithPriceList: twoItemPriceList.
	
	aSalesBook := SalesBook new.

	aMP := MerchantProcessorSimulator newWithClosure: [ :card :amount | true ].
	anErrorMP := MerchantProcessorSimulator newWithClosure: [ :card :amount | self error: 'This is a description error' ].

	aCashier := Cashier newWithSalesBook: aSalesBook andMP: aMP.

	feb2019 := Month month: 'february' year: 2019.
	feb2018 := Month month: 'february' year: 2018.

	firstFeb2018 := Date year: 2018 month: 'february' day: 1.
	
	eleven := Time hour: 11 minute: 0 second: 0.
	elevenTwenty := Time hour: 11 minute: 20 second: 0.
	elevenForty := Time hour: 11 minute: 40 second: 0.
	twelve := Time hour: 12 minute: 0 second: 0.
	
	aClient := 'John'.
	
	aCreditCard := CreditCard newWithExpirationDate: feb2019 andOwner: 'John Doe' andNumber: 0123456789012345.
	
	aClientPassDict := Dictionary newFrom: { 1 -> 'password'. 2 -> 'clave'. 3 -> 'otraClave' }.
	invalidClientAndPassword := 100 -> 'password'.
	
	restInterface := RestInterface newWithSalesBook: aSalesBook andPriceList: twoItemPriceList andMP: aMP andClientsPasswords: aClientPassDict.
	restInterfaceWithErrorMP := RestInterface newWithSalesBook: aSalesBook andPriceList: twoItemPriceList andMP: anErrorMP andClientsPasswords: aClientPassDict.! !


!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 18:41:30'!
addToCart: aCartId andBookIsbn: aBook andQuantity: anAmount 
	
	self addToCart: aCartId andBookIsbn: aBook andQuantity: anAmount onDate: firstFeb2018 andTime: eleven.! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 18:41:07'!
addToCart: aCartId andBookIsbn: aBook andQuantity: anAmount onDate: aDate andTime: aTime
	
	restInterface addToCartWithID: aCartId andBookIsbn: aBook andQuantity: anAmount onDate: aDate andTime: aTime.! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 20:36:40'!
cashierCheckout: aCart onDate: aDate

	^ aCashier checkoutCart: aCart byClient: aClient payingWith: aCreditCard onDate: aDate! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 19:19:13'!
cashierCheckoutWithValidCreditCard: aCart

	^ self cashierCheckout: aCart onDate: (Date newDay: 15 month: 5 year: 2017)! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 19:38:43'!
checkoutCart: aCartId
	
	^ self checkoutCart: aCartId onDate: firstFeb2018 andTime: eleven! !

!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/27/2017 16:39:52'!
checkoutCart: aCartId onDate: aDate andTime: aTime
	
	^ self checkoutCart: aCartId withRestInterface: restInterface onDate: aDate andTime: aTime! !

!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/27/2017 16:37:52'!
checkoutCart: aCartId withRestInterface: aRestInterface
	
	^ self checkoutCart: aCartId withRestInterface: aRestInterface onDate: firstFeb2018 andTime: eleven! !

!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/27/2017 16:39:05'!
checkoutCart: aCartId withRestInterface: aRestInterface onDate: aDate andTime: aTime

	^ aRestInterface checkoutCartWithId: aCartId ccn: 0123456789012345 cced: feb2019 cco: 'John Doe' onDate: aDate andTime: aTime! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 18:32:59'!
createCart
	
	^ self createCartOnDate: firstFeb2018 andTime: eleven.! !

!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/27/2017 13:16:30'!
createCartFor: aClientAndPassword
	
	^ restInterface createCartForClientID: aClientAndPassword key andPassword: aClientAndPassword value onDate: firstFeb2018 andTime: eleven! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 18:32:44'!
createCartOnDate: aDate andTime: aTime
	
	^ restInterface createCartForClientID: 1 andPassword: 'password' onDate: aDate andTime: aTime.! !

!TusLibrosTest methodsFor: 'private' stamp: 'NC 6/26/2017 19:02:11'!
listCart: aCartId
	
	^ restInterface listCart: aCartId onDate: firstFeb2018 andTime: eleven.! !

!TusLibrosTest methodsFor: 'private' stamp: 'PV 6/27/2017 13:18:24'!
listPurchasesFor: aClientAndPassword
	
	^ restInterface listPurchasesClientId: aClientAndPassword key andPassword: aClientAndPassword value! !


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

!Cashier methodsFor: 'cashier operations' stamp: 'NC 6/26/2017 20:24:17'!
checkoutCart: aCart byClient: aClient payingWith: aCreditCard onDate: aDate 

	| resultingTicket |

	aCart isEmpty ifTrue: [ self error: self class emptyCartCheckoutErrorDescription ].
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self class expiredCreditCardErrorDescription ].
	
	resultingTicket := self getTicketForCart: aCart.
	
	merchantProcessor debit: resultingTicket total from: aCreditCard.
	
	salesBook successfulSale: resultingTicket byClient: aClient.
	
	^ resultingTicket.
	
	
	! !


!Cashier methodsFor: 'initialization' stamp: 'NC 6/25/2017 16:33:25'!
initializeWithSalesBook: aSalesBook andMP: aMerchantProcessor 

	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor! !


!Cashier methodsFor: 'private' stamp: 'NC 6/26/2017 21:09:41'!
getTicketForCart: aCart
	
	| cartContents total |
	
	total := 0.
	cartContents := aCart contents.

	cartContents asSet do: [ :product | total :=  total + ((cartContents occurrencesOf: product) * (aCart priceOf: product )) ].
	
	^ Ticket newWithProducts: cartContents andATotal: total.! !

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
	instanceVariableNames: 'salesBook priceList mP clientByCart clientPasswords cartsIds cartIdCounter cartActionDateTime transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!RestInterface methodsFor: 'initialization' stamp: 'NC 6/26/2017 21:15:28'!
initializeWithWithSalesBook: aSalesBook andPriceList: aPriceList andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict

	salesBook := aSalesBook.
	priceList := aPriceList.
	mP := aMerchantProcessorSimulator.
	clientPasswords := aClientPassDict.
	cartsIds := Dictionary new.
	clientByCart := Dictionary new.
	cartActionDateTime := Dictionary new.
	transactions := Dictionary new.
	cartIdCounter := 0.! !


!RestInterface methodsFor: 'interface operations' stamp: 'NC 6/26/2017 19:32:40'!
addToCartWithID: aCartId andBookIsbn: aBookIsbn andQuantity: aNumber onDate: aDate andTime: aTime

	self checkCartExists: aCartId.
	self checkCartExpiration: aCartId withDateTime: (DateAndTime date: aDate time: aTime).
	
	(cartsIds at: aCartId) add: aBookIsbn times: aNumber

	! !

!RestInterface methodsFor: 'interface operations' stamp: 'PV 6/27/2017 17:30:04'!
checkoutCartWithId: aCartId ccn: aCardNumber cced: aMonth cco: aName onDate: aDate andTime: aTime

	| newCashier cart card |
	
	self checkCartExists: aCartId.
	self checkCartExpiration: aCartId withDateTime: (DateAndTime date: aDate time: aTime).
	
	newCashier := Cashier newWithSalesBook: salesBook andMP: mP.
	cart := cartsIds at: aCartId.
	card := CreditCard newWithExpirationDate: aMonth andOwner: aName andNumber: aCardNumber.
	
	newCashier checkoutCart: cart byClient: (clientByCart at: aCartId) payingWith: card onDate: aDate.
	
	cartsIds removeKey: aCartId.
	cartActionDateTime removeKey: aCartId.
	clientByCart removeKey: aCartId.! !

!RestInterface methodsFor: 'interface operations' stamp: 'NC 6/26/2017 20:38:53'!
createCartForClientID: aClientId andPassword: aPassword onDate: aDate andTime: aTime

	| cart cartId |
	
	self validateClient: aClientId andPassword: aPassword.
	
	cartIdCounter := cartIdCounter + 1.
	
	cart := Cart newWithPriceList: priceList.
	cartId := cartIdCounter.
	
	cartsIds add: cartId -> cart.
	cartActionDateTime at: cartId put: (DateAndTime date: aDate time: aTime).
	clientByCart at: cartId put: aClientId. 
	
	^ cartId! !

!RestInterface methodsFor: 'interface operations' stamp: 'NC 6/26/2017 19:32:49'!
listCart: aCartId onDate: aDate andTime: aTime

	self checkCartExists: aCartId.
	self checkCartExpiration: aCartId withDateTime: (DateAndTime date: aDate time: aTime).

	^ (cartsIds at: aCartId) contents! !

!RestInterface methodsFor: 'interface operations' stamp: 'NC 6/26/2017 21:17:32'!
listPurchasesClientId: aClientId andPassword: aPassword

	| total products |
	
	self validateClient: aClientId andPassword: aPassword.
	
	total := 0.
	products := Bag new.
	
	(salesBook clientTickets: aClientId) do: [ :ticket | products addAll: ticket products. total := total + ticket total ].
	
	^ Ticket newWithProducts: products andATotal: total
	
	
	
	! !


!RestInterface methodsFor: 'private' stamp: 'NC 6/26/2017 19:32:24'!
checkCartExists: aCartId

	(cartsIds includesKey: aCartId) ifFalse: [ self error: self class unknownCartIdErrorDescription ].
	! !

!RestInterface methodsFor: 'private' stamp: 'NC 6/26/2017 18:50:05'!
checkCartExpiration: aCartId withDateTime: aDateAndTime

	((cartActionDateTime at: aCartId) + (Duration minutes: 30) < aDateAndTime) ifTrue: [ self error: self class cartExpiredErrorDescription ].
	
	cartActionDateTime at: aCartId put: aDateAndTime 

	! !

!RestInterface methodsFor: 'private' stamp: 'NC 6/26/2017 19:30:56'!
validateClient: aClientId andPassword: aPassword
	
	(clientPasswords includesKey: aClientId)
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
		
	(clientPasswords at: aClientId) = aPassword
		ifFalse: [ self error: self class invalidClientPasswordCombinationErrorDescription ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestInterface class' category: #'TusLibros-Solution'!
RestInterface class
	instanceVariableNames: ''!

!RestInterface class methodsFor: 'error descriptions' stamp: 'NC 6/26/2017 18:44:06'!
cartExpiredErrorDescription

	^ 'The cart has expired'! !

!RestInterface class methodsFor: 'error descriptions' stamp: 'PV 6/26/2017 14:03:52'!
invalidClientPasswordCombinationErrorDescription

	^ 'Invalida client-password combination'! !

!RestInterface class methodsFor: 'error descriptions' stamp: 'NC 6/26/2017 17:11:53'!
unknownCartIdErrorDescription

	^ 'Unkown cart id'! !


!RestInterface class methodsFor: 'instance creation' stamp: 'PV 6/24/2017 17:56:46'!
newWithSalesBook: aSalesBook andPriceList: aDictionary andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict

	^ self new initializeWithWithSalesBook: aSalesBook andPriceList: aDictionary andMP: aMerchantProcessorSimulator andClientsPasswords: aClientPassDict! !


!classDefinition: #SalesBook category: #'TusLibros-Solution'!
Object subclass: #SalesBook
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!SalesBook methodsFor: 'accessing' stamp: 'NC 6/26/2017 20:53:42'!
clientTickets: aClient
	
	^ sales at: aClient ifAbsent: [ ^ Set new ]! !

!SalesBook methodsFor: 'accessing' stamp: 'PV 6/27/2017 17:07:00'!
salesCount
	
	^ (sales values inject: Set new into: [ :sum :set | sum union: set ]) size! !


!SalesBook methodsFor: 'adding' stamp: 'PV 6/27/2017 16:54:21'!
successfulSale: aTicket byClient: aClient

	sales at: aClient ifAbsentPut: Set new.
	(sales at: aClient) add: aTicket! !


!SalesBook methodsFor: 'initialization' stamp: 'PV 6/27/2017 16:54:01'!
initialize

	sales := Dictionary new! !


!classDefinition: #Ticket category: #'TusLibros-Solution'!
Object subclass: #Ticket
	instanceVariableNames: 'products total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Ticket methodsFor: 'accessing' stamp: 'NC 6/26/2017 21:18:13'!
products
	
	^ products.! !

!Ticket methodsFor: 'accessing' stamp: 'NC 6/26/2017 21:10:20'!
total
	
	^ total.! !


!Ticket methodsFor: 'initialization' stamp: 'NC 6/26/2017 21:18:02'!
initializeWithProducts: aBagOfProducts andATotal: anAmount
	
	products := aBagOfProducts.
	total := anAmount.! !


!Ticket methodsFor: 'testing' stamp: 'NC 6/26/2017 21:18:08'!
occurrencesOf: aProduct
	
	^ products occurrencesOf: aProduct.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ticket class' category: #'TusLibros-Solution'!
Ticket class
	instanceVariableNames: ''!

!Ticket class methodsFor: 'instance creation' stamp: 'NC 6/26/2017 21:08:42'!
newWithProducts: aBagOfProducts andATotal: anAmount
	
	^ self new initializeWithProducts: aBagOfProducts andATotal: anAmount ! !
