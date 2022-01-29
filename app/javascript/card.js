const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
   e.preventDefault();
   
   const formResult = document.getElementById("charge-form");
   const formData = new FormData(formResult);
  const card = {
    namber: formData.get("shipping_address[nuber]"),
    cvc: formData.get("shipping_address[cvc]"),
    exe_month: formData.get("shipping_address[exp_month]"),
    exp_year: `20${formData.get("shipping_address[exp_year]")}`,
  };
  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }
     document.getElementById("card_number").removeAttribute("name");
      document.getElementById("card_cvc").removeAttribute("name");
      document.getElementById("card_exp_month").removeAttribute("name");
      document.getElementById("card_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
   });
  });
};
window.addEventListener("load", pay);