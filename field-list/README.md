# Phase 2 — Field List
## Data Fields 
| Field | Why needed | Notes / Uncertainty |
| --- | --- | --- |
## Customer 
| Customers |  |  |
| --- | --- | --- |
| CustomerID(PK) | Identifier for each customer | auto-assign |
| FirstName | For customer information | ... |
| LastName | For customer information | ...|
| Email | For customer information | ... |
| Phone | For direct contact with customer | ... |
## Address
| Address |  |  |
| --- | --- | --- |
| Address(PK) | Identifier for the direct location of the customers | ... |
| City | Identifier for the customer's current city | ... |
| State | Identifier for the customer's current state | ... |
| Zip | Identifier for the customer's current zip | ... |
## Brand
| Brand |  |  |
| --- | --- | --- |
| BrandID(PK) | Identifier for the individual brand names | ... |
| BrandName | Identifier for the name of the brand | ... |
## Series
| Series |  |  |
| --- | --- | --- |
| SeriesID(PK) | ... | ... |
| SeriesName | ... | ... |
## Box
| Box |  |  |
| --- | --- | --- |
| BoxID(PK) |Identifier for each box for the customer | ... |
| BrandID(FK) |Identifier for what brand is being used to by packs | ... |
| SeriesID(FK) | ... | ... |
| Year | Identifier for how old or new the pack is | ... |
| PksPerBox | Identifier for how many packs are in each box | ... |
| CardsPerPack | Identifier for how many cards are in each pack | ... |
| Price | Identifier for the cost of the box | ... |
## Payment
| Payment |  |  |
| --- | --- | --- |
| PaymentID | ... | ... |
| Type | Identifier for what the pack is | ... |
## Orders
| Orders |  |  |
| --- | --- | --- |
| OrderID | ... | ... |
| BoxID(FK) | ... | ... |
| Quantity | Identifier for number of boxes bought | ... |
| CheckoutID | Identifier for what pack of cards is bought | ... |



## Calculated Field (do Not store)
| Field | Derivation |
| --- | --- |
| TotalCharge | Price + TaxRate x Quantity | 
