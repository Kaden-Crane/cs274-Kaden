# Phase 2 — Field List
## Data Fields
| Field | Why needed | Notes / Uncertainty |
| --- | --- | --- |
| CustomerID(PK) | Identifier for each customer | auto-assign |
| FirstName | For customer information | ... |
| LastName | For customer information | ...|
| Email | For customer information | ... |
| Address | Identifier for the direct location of the customers | ... |
| City | Identifier for the customer's current city | ... |
| State | Identifier for the customer's current state | ... |
| Zip | Identifier for the customer's current zip | ... |
| PrimaryPhone | For direct contact with customer | ... |
| EmergencyPhone | For phone calls incase of emergencies | ... |
| CheckoutID | Identifier for what pack of cards is bought | ... |
| Quantity | Identifier for number of boxes bought | ... |
| PksPerBox | Identifier for how many packs are in each box | ... |
| CardsPerPack | Identifier for how many cards are in each pack | ... |
| ItemCost | Identifier for the price of the packs | ... |
| TaxRate | Identifier for the taxes being added to the price at checkout | ... |
| BoxID |Identifier for each box for the customer | ... |
| Brand |Identifier for what brand is being used to by packs | ... |
| Type | Identifier for what the pack is | ... |
| Year | Identifier for how old or new the pack is | ... |


## Calculated Field (do Not store)
| Field | Derivation |
| --- | --- |
| TotalCharge | ItemCost + TaxRate x Quantity | ...
