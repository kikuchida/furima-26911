window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");// 金額を入力した数値をpriceInputという変数に格納する
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
    // 入力した金額を取得する
    const inputValue = priceInput.value;
    console.log(inputValue);
    // 手数料を表示する場所を変数に代入する（3行目を見ながら）
    const addTaxDom = document.getElementById("add-tax-price");
    // 利益を表示する場所を変数に代入する（3行目を見ながら）
    const profit = document.getElementById("profit");
    //手数料を計算し、画面上に反映させる。
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    //利益を計算し、画面上に反映させる。
    profit.innerHTML = Math.floor(inputValue * 0.9);
  })
});