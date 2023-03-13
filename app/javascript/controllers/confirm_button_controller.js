const displayAlertOnButtonClick = () => {
  // TODO: Select the big green button
  const button = document.querySelector(".hike-confirm-button");

  // TODO: Bind the `click` event to the button
  button.addEventListener("click", () => {
    alert("Hike confirmed!");
    event.currentTarget.innerText = "Hold still..."
  });
  // // TODO: On click, display `Thank you!` in a JavaScript alert!
};

displayAlertOnButtonClick(); // Do not remove!
