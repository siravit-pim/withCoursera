-- ****************************************************************
"""
Assignment:
1 Was the GetMaxQuantity() procedure properly implemented?
2 Was the ManageBooking() procedure properly implemented?
3 Was the UpdateBooking() procedure properly implemented?
4 Was the AddBooking() procedure properly implemented?
5 Was the CancelBooking() procedure properly implemented?
"""
-- ****************************************************************
  
"""
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(quantity) AS QTY, OrderID, OrderDate, CustomerID, CourseID
    FROM factorder
    GROUP BY OrderID, OrderDate, CustomerID, CourseID
END;
"""
#-------------------
"""
CREATE PROCEDURE ManageBooking(OrderID_INPUT varchar(11)) 
BEGIN
	SELECT OrderID, Cost, Sales, Quantity
    FROM factorder
    WHERE OrderID = OrderID_INPUT;
END;
"""
#-------------------
"""
CREATE PROCEDURE UpdateBooking(OrderID_INPUT varchar(11), OrderDate_INPUT date)
BEGIN
    UPDATE factorder
    SET OrderDate = OrderDate_INPUT
    WHERE OrderID = OrderID_INPUT;
END;
"""
#-------------------
"""
CREATE PROCEDURE AddCustomer(OrderID_INPUT varchar(11), OrderDate_INPUT date, Quantity_INPUT INT, Sales_INPUT DECIMAL(19,9))
BEGIN
	INSERT INTO factorder (OrderID, OrderDate, Quantity, Sales)
	VALUES (OrderID_INPUT, OrderDate_INPUT, Quantity_INPUT, Sales_INPUT);
END;
"""
#-------------------
"""
CREATE PROCEDURE CancelBooking(OrderID_INPUT varchar(11))
BEGIN
	DELETE FROM factorder 
    WHERE OrderID = OrderID_INPUT;
END;
"""
