 $(function(){
    $(".add-to-cart").click(function(e){
        addToCart(e);
    });
    var mArray = JSON.parse(localStorage.getItem("cartitems"));

     if(mArray == null) {
         mArray = [];
     }
     prepareMailData(mArray);
     showCartInfo(mArray);
    // setCartInfoInSession(JSON.stringify(arrayCartItems));
    showProductList(mArray);
});//end of document ready

function showCartInfo(tempArray){
    var totalPrice = 0;
    if(tempArray){
        for (i = 0; i < tempArray.length; i++) {

            totalPrice += parseFloat(tempArray[i].price);
        }
    }
    $(".cartitem").html(tempArray.length);
    $(".total-price").html(totalPrice.toFixed(2));
}

function showProductList(mArray){
    var itRow = '';
    var myUniqueArray = filterDuplicateObject(mArray);
    $.each(myUniqueArray,function(index, value){
        var tQuantity = calculateTotalQuantity(value.id, mArray);
        var tPrice = calculateTotalPrice(value.id, mArray);

        itRow +='<tr><td><img width="100" src="/Demo/static/images/products/'+value.image+'"</td>';
        itRow +='<td>'+value.brand+'<br>'+value.name+'<br></td>';
        itRow +='<td single-item-price="'+value.price+'">'+value.price+'</td>';
        itRow +='<td><input class="product-quantity-value span1" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" type="text" value="'+tQuantity+'"><div class="input-append"><button onclick="removeFromCart(event);" class="btn btn-mini" type="button">-</button><button onclick="addToCart(event);" class="add-to-cart btn btn-mini" type="button" product-id="'+value.id+'" product-price="'+value.price+'" product-name="'+value.name+'" product-image="'+value.image+'" product-add="'+tQuantity+'" product-brand="'+value.brand+'"> + </button><button onclick="removeFromCart(event,1);" class="btn btn-mini btn-danger" type="button"><span class="icon-remove"></span></button></div></td>';
        itRow +='<td class="total-price" t-price="'+tPrice+'">'+tPrice+'</td>';
        itRow +='</tr>';

    });
    var lastRow ='<tr><td colspan="5" class="alignR">Total products:</td><td class="label label-primary"> $448.42</td></tr>';
    $("#mtable-body").html(itRow);
  // var sendMail ='<input type="submit" value="Send Email" class="shopBtn">';



}

function filterDuplicateObject(tempArray) {
    var finalArray = {};
    $.each(tempArray,function(index,value){
        finalArray[value.id]= value;
    });
    return finalArray;
}

function calculateTotalPrice(productID,tempArray){
    var totalPrice = 0;
    $.each(tempArray,function(index,value){
        if(productID == value.id){
            totalPrice +=parseFloat(value.price);
        }
    });
    return totalPrice.toFixed(2);
}
function calculateTotalQuantity(productID,tempArray){
    var totalQuantity = 0;
    $.each(tempArray,function(index,value){
        if(productID == value.id){
            totalQuantity ++;
        }
    });
    return totalQuantity;
}
 function addToCart(e){
     var mThis = e.currentTarget;
     var productID = $(mThis).attr('product-id');
     var price = $(mThis).attr('product-price');
     var image = $(mThis).attr('product-image');
     var name = $(mThis).attr('product-name');
     var brand = $(mThis).attr('product-brand');
     var arrayCartItems = JSON.parse(localStorage.getItem("cartitems"));
     if(arrayCartItems == null) {
         arrayCartItems = [];
     }
     var tempObj = {id:productID,price:price,image:image,name:name,brand:brand};
     arrayCartItems.push(tempObj);
     localStorage.setItem("cartitems", JSON.stringify(arrayCartItems));
     var atFirst = JSON.parse(localStorage.getItem("cartitems"));
     if(atFirst == null) {
         atFirst = [];
     }

     if(mThis.hasAttribute("product-add")){
         var oldQuantity = $(mThis).parents("td").find(".product-quantity-value").attr("value");
         var oldValue = parseFloat(oldQuantity);
         var newValue = oldValue +1;
         $(mThis).parents("td").find(".product-quantity-value").attr("value",newValue);
         location.reload();

         /*var oldTotalPrice = $(mThis).parents("td").next().attr("t-price");
         var newTotalPrice =parseFloat(oldTotalPrice) + parseFloat(price);
         var toBeModified = $(mThis).parents("td").next();
         $(toBeModified).attr("t-price", newTotalPrice);*/

     }
     showCartInfo(atFirst);
   /*  if(mThis.hasAttribute("product-subs")){
         var oldQuantity = $(mThis).parents("td").find(".product-quantity-value").attr("value");
         var oldValue = parseFloat(oldQuantity);
         var newValue = oldValue +1;
         $(mThis).parents("td").find(".product-quantity-value").attr("value",newValue);

     }*/


 }

 function removeFromCart(e,deleteAll){
     var mThis = e.currentTarget;
     if(deleteAll) {
         var productID = $(mThis).prev().attr('product-id');
         var price = $(mThis).prev().attr('product-price');
         var image = $(mThis).prev().attr('product-image');
         var name = $(mThis).prev().attr('product-name');

         var brand = $(mThis).prev().attr('product-brand');
     } else {
         var productID = $(mThis).next().attr('product-id');
         var price = $(mThis).next().attr('product-price');
         var image = $(mThis).next().attr('product-image');
         var name = $(mThis).next().attr('product-name');
         var brand = $(mThis).next().attr('product-brand');

     }

     var arrayCartItems = JSON.parse(localStorage.getItem("cartitems"));
     if(arrayCartItems == null) {
         arrayCartItems = [];
     }
     var stopDelete = 0;
     var finalArray = [];
     $.each(arrayCartItems,function(index,value){
         if(deleteAll) {
             if(productID != value.id) {
                 finalArray.push(value);
             }
         } else {
             if(productID == value.id && stopDelete ==0) {
                 stopDelete = 1;
                 // don't push
             } else {
                 finalArray.push(value);
             }
         }

     });

     localStorage.setItem("cartitems", JSON.stringify(finalArray));
     location.reload();

 }
 function prepareMailData(mArray){
     var grandTotalPrice = 0;
     if(mArray){
         for (i = 0; i < mArray.length; i++) {

             grandTotalPrice += parseFloat(mArray[i].price);
         }
     }
     var finalArray = [];
     var myUniqueArray = filterDuplicateObject(mArray);
     $.each(myUniqueArray,function(index, value){
         var tPrice = calculateTotalPrice(value.id, mArray);
         var tQuantity = calculateTotalQuantity(value.id, mArray);
         var tempObj = {
             id:value.id,
             brand:value.brand,
             name:value.name,
             quantity:tQuantity,
             totalPrice:parseFloat(tPrice),
             grandTotalPrice:grandTotalPrice
         };
         finalArray.push(tempObj);
     });
     var mData = JSON.stringify(finalArray);
     $("#cart-data").attr("value", mData);
 }





