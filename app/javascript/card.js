const pay = () => {
  Payjp.setPublicKey("pk_test_bfbee756b72d177544e38628");
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => { 
    e.preventDefault();
  console.log("フォーム送信時にイベント発火");
});
};
 window.addEventListener("load", pay);
  