pragma solidity >=0.7.0 <0.9.0;

contract DealForTshirtHere
{
    string public PaymentStatus = "Pending";
    string public OrderStatus = "Pending";
    bool dealforneworder = false;
    address public Beach;
    uint public QuantityofTShirtsCountHere;
    address public CompanyABC;
    
    uint public Cost;

    constructor(uint quantity) public
    {
        Beach = msg.sender;
        QuantityofTShirtsCountHere = quantity;
    }

    function AcceptOffer() public
    {
        if ( msg.sender == Beach )
        {
            revert("Threads Inc will accept the offers!");
        }

        dealforneworder = true;
        OrderStatus = "Order Complete!";
        Cost = QuantityofTShirtsCountHere*750;
    }
    
    function MakePayment() public
    {
        
        if ( dealforneworder == false )
        {
            if (msg.sender == Beach)
            {
                revert("Let the offer be accepted first!");
            }
            else
            {
                revert("CompanyABC can't make payment for themselves!");
            }
        }
        
        else
        {
            if ( msg.sender != Beach )
            {
                revert("CompanyABC can't make payment for themselves!");
            }
            
            PaymentStatus = "Done!";
        }
        
    }