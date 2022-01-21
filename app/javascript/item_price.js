window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
    console.log(priceInput);
  console.log("イベント発火");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTaxDom);
  const profitNumber = document.getElementById("profit")
     profitNumber.innerHTML = (Math.floor(inputValue - inputValue * 0.1));
     console.log(profitNumber);
    })
});