# Phase 2 — Field List
## Data Fields 
| Field | Why needed | Notes / Uncertainty |
| --- | --- | --- |
## Customer 
| Customers | Stores name, contact info, and ID each person who buys boxes of baseball cards |  |
| --- | --- | --- |
| CustomerID(PK) | Identifier for each customer | auto-assign |
| FirstName | For customer information | ... |
| LastName | For customer information | ...|
| Email | For customer information | ... |
| Phone | For direct contact with customer | ... |
| Add1 | Identifier for customer address | --- |
| Add2 | identifier for the apartment or box # | --- |
| City | Identifier for the customer's current city | ... |
| State | Identifier for the customer's current state | ... |
| Zip | Identifier for the customer's current zip | ... |
## Brand
| Brand | Stores name, and ID for the brand on the packs |  |
| --- | --- | --- |
| BrandID(PK) | Identifier for the individual brand names | ... |
| BrandName | Identifier for the name of the brand | ... |
## Series
| Series | Stores the name and ID for how new the packs are |  |
| --- | --- | --- |
| SeriesID(PK) | ... | ... |
| SeriesName | Name of what the packs belong to | ... |
| Year(PK) | Identifier for how old or new the packs are | ... |
## Box
| Box | Stores box info, the amount of cards and packs are in each box, and an ID for each box |  |
| --- | --- | --- |
| BoxID(PK) |Identifier for each box for the customer | ... |
| BrandID(FK-> Brand) |Identifier for what brand is being used to by packs | ... |
| SeriesID(FK-> Series) | ... | ... |
| Year(FK-> Series) | Identifier for how old or new the packs are | ... |
| Type(PK) | Identifier for what the pack is inside the box | ... |
| PksPerBox | Identifier for how many packs are in each box | ... |
| CardsPerPack | Identifier for how many cards are in each pack | ... |
| Price(PK) | Identifier for the cost of the box | ... |
## Orders
| Orders | Stores the info for the number of boxes that are in the order , has an ID for what what is in the order |  |
| --- | --- | --- |
| OrderID | ... | ... |
| CustomerID(FK-> Customers) | ... | ... |
| BoxID(FK-> Box) | ... | ... |
| Quantity(PK) | Identifier for number of boxes bought | ... |
| CheckoutID | Identifier for what pack of cards is bought | ... |
## Payment
| Payment | Stores info for how much the order costs before taxes, Has an ID for the price of the order |  |
| --- | --- | --- |
| PaymentID(PK) | ... | ... |
| Price(FK-> Box) | ... | ... |
| Quantity(FK-> Orders) | ... | ... |
| BoxID(FK) |Identifier for each box for the customer | ... |

## Calculated Field (do Not store)
| Field | Derivation |
| --- | --- |
| TotalCharge | Price + TaxRate x Quantity | 
## Reflection
I had a hard time creating the box table because I was trying to understand what field needs a primary and foreign key was as well as what other fields belong to that one. From my W3-A1 draft, I decided to remove the EmergencyPhone field because it was redundant for the domain that I am making. I also got rid of the Address field because I have the City, Street, and Zip fields which I could just add to the Customer table. I'm still having some trouble figuring out what the primary key and foreign key for the different tables and also trying to figure out what values should and shouldn't be stored. I know for certain that the full price of the order is a calculated field that is meant to be hidden but I do wonder if I should add a foreign key into the payment table.
