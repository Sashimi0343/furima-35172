function calculation() {

  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup", () => {

    const price = item_price.value;

    const fee = document.getElementById("add-tax-price");
    const fee_tax = price / 10
    fee.innerHTML = `${Math.floor(fee_tax)}`;

    const profit = document.getElementById("profit");
    const income = price - fee_tax
    profit.innerHTML = `${Math.ceil(income)}`;
  });
}

window.addEventListener("load", calculation);