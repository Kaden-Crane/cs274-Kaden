# Phase 7 — PHP App
## What the file does

- Connects to the database

Uses db.php to create a PDO database connection.

- Executes a JOIN query

Combines data from the following tables:
Customers
Orders
OrderItems
Box
Brand
Series

- Retrieves order information

Customer first and last name
Brand name of the card box
Series name
Order date
Order status

- Sorts results

Displays the newest orders first using:
SQL
ORDER BY o.OrderDate DESC

- Handles database errors

Uses a try/catch block.
Logs database errors without exposing technical details to users.
Displays a simple "DB error" message if something goes wrong.

- Displays the results

Shows the total number of records returned.
Presents the data in a formatted HTML table.
Alternates row colors for readability.

- Handles empty results

If no records exist, displays:
No orders found.
