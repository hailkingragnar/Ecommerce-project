let SearchForm = document.querySelector('.search-form');
document.querySelector('#search-btn').onclick = () =>
{
    SearchForm.classList.toggle('active');
    LoginForm.classList.remove('active');
    ShoppingCart.classList.remove('active');

};

let ShoppingCart = document.querySelector('.shopping-cart');
document.querySelector('#cart-btn').onclick = () =>
{
    ShoppingCart.classList.toggle('active');
    LoginForm.classList.remove('active');
    SearchForm.classList.remove('active');
};




let LoginForm = document.querySelector('.login-form');
document.querySelector('#account-btn').onclick = () =>
{
    LoginForm.classList.toggle('active');
    SearchForm.classList.remove('active');
    ShoppingCart.classList.remove('active');
    
};

window.onscroll = () =>
{
    SearchForm.classList.remove('active');
    LoginForm.classList.remove('active');
    ShoppingCart.classList.remove('active');
};



/*slider*/
/*var swiper = new Swiper(".product-slider", {
    loop: true,
    spaceBetween: 20,
    autoplay:
    {
        delay: 7500,
        disableoninteraction: false,
    },
    breakpoints: {
    0: {
        slidesPerView: 1,
    },
    768: {
        slidesPerView: 4,
        spaceBetween: 40,
    },
    1024: {
        slidesPerView: 5,
        spaceBetween: 50,
    },
    },
});
/*slider*/



//cart-working js
if (document.readyState=="loading"){
    document.addEventListener("DOMContentLoaded", ready);
}else{
    ready();
}

//making-function
function ready(){
    //removes item from cart
    var removeCartButtons = document.getElementsByClassName('cart-remove')
    console.log(removeCartButtons)
    for(var i=0; i < removeCartButtons.length;i++){
        var button= removeCartButtons[i];
        button.addEventListener('click',removeCartItem)
    }
    //quantity changes
    var quantityInputs= document.getElementsByClassName('cart-quantity');
    for(var i=0; i < quantityInputs.length; i++){
        var input =quantityInputs[i];
        input.addEventListener("change",quantityChanged);

    }
    //add to cart
    var addCart = document.getElementsByClassName('add-cart');
    for(var i=0; i < addCart.length; i++){
    var button = addCart[i];
    button.addEventListener("click",addCartClicked);
    }
    //buy button work
    document.getElementsByClassName('btn')[0].addEventListener('click',buyButtonClicked);
}
//buy button
function buyButtonClicked(){
    alert("your order is placed");
    var cartContent= document.getElementsByClassName('cart-content')[0]
    while (cartContent.hasChildNodes()){
        cartContent.removeChild(cartContent.firstChild);
    }
    updatetotal();
}


//remove items from cart
function removeCartItem(event){
    var buttonClicked= event.target;
    buttonClicked.parentElement.remove();
    updatetotal();
}


//quantity changes
function quantityChanged(event){
    var input= event.target;
    if(isNaN(input.value) || input.value <=0){
    input.value= 1;
    }
    updatetotal();
    

}


//add to cart
function addCartClicked(event){
    var button= event.target;
    var shopProducts = button.parentElement;
    var title = shopProducts.getElementsByClassName("product-title")[0].innerText;
    var price = shopProducts.getElementsByClassName("price")[0].innerText;
    var productImg = shopProducts.getElementsByClassName("product-img")[0].src;
    addProductToCart(title,price,productImg);
    updatetotal();
}

function addProductToCart(title,price,productImg){
    var cartShopBox = document.createElement("div");
    cartShopBox.classList.add("cart-box")
    var cartItems= document.getElementsByClassName("cart-content")[0];
    var cartItemsNames = cartItems.getElementsByClassName("cart-product-title");
    for(var i=0; i < cartItemsNames.length; i++){
        if (cartItemsNames[i].innerText == title){
        alert("You haave already add this product to cart");
        return;
        }
    }
    

    var cartBoxContent =`
    <img src="${productImg}" alt="" class="cart-img">
                
                    <div class="cart-product-title">${title}</div>
                    <div class="cart-price">${price}</div>
                    <input type="number" value="1" class="cart-quantity">
                
            <i class='bx bxs-trash-alt cart-remove'></i> 
        
    `;

    cartShopBox.innerHTML = cartBoxContent;
    cartItems.append(cartShopBox);
    cartShopBox.getElementsByClassName("cart-remove")[0].addEventListener("click",removeCartItem);
    cartShopBox.getElementsByClassName("cart-quantity")[0].addEventListener("change",quantityChanged);
}
//update total
function updatetotal(){
    var cartContent =document.getElementsByClassName("cart-content")[0];
    var cartBoxes =cartContent.getElementsByClassName("cart-box");
    var total=0;
    for (var i=0 ;i < cartBoxes.length; i++)
    {
        var cartBox= cartBoxes[i];
        var priceElement= cartBox.getElementsByClassName("cart-price")[0];
        var quantityElement= cartBox.getElementsByClassName("cart-quantity")[0];
        var price= parseFloat(priceElement.innerText.replace("Rs",""));
        var quantity= quantityElement.value;
        total = total + price*quantity;
    }

        document.getElementsByClassName('total-price')[0].innerText =("Rs" + total);

    
}