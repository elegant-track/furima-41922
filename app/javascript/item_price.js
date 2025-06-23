const price = () => {
  const priceInput = document.getElementById("item-price")
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = parseInt(inputValue, 10);

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);
      const profit = price -fee;

      addTaxDom.innerHTML = `${fee}`;
      profitDom.innerHTML = `${profit}`;
    } else {
      addTaxDom.innerHTML = "__";
      profitDom.innerHTML = "__";
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
