window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   (inputValue);

   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.round(inputValue*0.1)

   const addTax = document.getElementById("profit");
   addTax.innerHTML = inputValue - Math.round(inputValue*0.1)


})
});