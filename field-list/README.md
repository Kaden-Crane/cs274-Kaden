# Phase 2 — Field List
## Data Fields 
| Field | Type | Null? | Default | Notes/ Constraints |
| --- | --- | --- | --- | --- |
## Customer 
| Customer |  |  |  |  |
| --- | --- | --- | --- | --- |
| CustomerID(PK) | INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| FirstName | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| LastName | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| Email | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| Phone | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| Add1 | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| Add2 | VARCHAR(50) | NULL | --- | Not sure what to put after |
| City | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| State | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
| Zip | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
## Brand
| Brand |  |  |  |  |
| --- | --- | --- | --- | --- |
| BrandID(PK) | INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| BrandName | VARCHAR(50) | NOT NULL | --- | Not sure what to put after |
## Series
| Series |  |  |  |  |
| --- | --- | --- | --- | --- |
| Series |  |  |  |  |
| SeriesID(PK) |INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| SeriesName | VARCHAR(50)  | NOT NULL | --- | Not sure what to put after |
| Year(PK) | YEAR | NOT NULL | --- | Not sure what to put after |
## Box
| Box |  |  |  |  |
| --- | --- | --- | --- | --- |
| BoxID(PK) | INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| BrandID(FK-> BrandID) |INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| SeriesID(FK-> SeriesID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| Year(FK-> SeriesID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| Type | VARCHAR(50) | NULL | --- | Not sure what to put after |
| PksPerBox | FLOAT | NOT NULL | --- | Not sure what to put after 
| CardsPerPack | DOUBLE | NOT NULL | --- | Not sure what to put after |
| Price | DECIMAL | NOT NULL | --- | Not sure what to put after|  
## Orders
| Orders |  |  |  |  |
| --- | --- | --- | --- | --- |
| OrderID(PK) |INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| CustomerID(FK-> Customers) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| BoxID(FK-> BoxID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| Quantity(PK) | INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| CheckoutID | INT INSIGNED | NOT NULL | AUTO_INCREMENT | No PK |
| Date | Date | NOT NULL | --- | Not sure what to put after | 
## Payment
| Payment |  |  |  |  |
| --- | --- | --- | --- | --- |
| PaymentID(PK) | INT INSIGNED | NOT NULL | AUTO_INCREMENT | PK - surrogate, auto-assign |
| Price(FK-> BoxID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| Quantity(FK-> OrderID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |
| BoxID(FK-> BoxID) | INT UNSIGNED | AUTO_INCREMENT | FK - surrogate, auto-assign |

## Calculated Field (do Not store)
| Field | Derivation |
| --- | --- |
| TotalCharge | Price + TaxRate x Quantity | 
## Reflection
I had a hard time creating the box table because I was trying to understand what field needs a primary and foreign key was as well as what other fields belong to that one. From my W3-A1 draft, I decided to remove the EmergencyPhone field because it was redundant for the domain that I am making. I also got rid of the Address field because I have the City, Street, and Zip fields which I could just add to the Customer table. I'm still having some trouble figuring out what the primary key and foreign key for the different tables and also trying to figure out what values should and shouldn't be stored. I know for certain that the full price of the order is a calculated field that is meant to be hidden but I do wonder if I should add a foreign key into the payment table.
