const pay = () => {
  Payjp.setPublicKey("pk_test_e84232859c120cf8b9ad4fb1"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_shipping_add[number]"),
      cvc: formData.get("order_shipping_add[cvc]"),
      exp_month: formData.get("order_shipping_add[exp_month]"),
      exp_year: `20${formData.get("order_shipping_add[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      }
    });
  });
};

window.addEventListener("load", pay);
