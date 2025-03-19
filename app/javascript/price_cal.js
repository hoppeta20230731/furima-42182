const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const priceValue = priceInput.value;
    const tax = Math.floor(priceValue * 0.1);
    const profit = priceValue - tax;
    addTaxDom.innerHTML = tax;
    addProfitDom.innerHTML = profit;
 })
 };
 
 window.addEventListener("turbo:load", price);
 window.addEventListener("turbo:render", price);