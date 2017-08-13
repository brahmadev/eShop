// displayCart : Function

$(".add-to-cart").click(function(event){
    event.preventDefault;
    var name = $(this).attr("data-name");
    var price = Number($(this).attr("data-price"));

    shoppingCart.addItemToCart(name,price,1);
    displayCart();
});
$("#clear-cart").click(function(event){
    shoppingCart.clearCart();
    displayCart();
});

function displayCart() {
    var cartArray=shoppingCart.listCart();
    var output="";

    for(var i in cartArray){
        output += "<li>"
        +cartArray[i].name
        +"<input class ='item-count' type='number'"
    }

}



