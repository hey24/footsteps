import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirm-button"
export default class extends Controller {
  static targets = ["hikes"]

  connect() {
    console.log('connecting confirm button')
    // console.log(this.hikesTarget)
    // this.addEventListener
  }

  change(e) {
    console.log(e.currentTarget.innerText)
    e.currentTarget.innerText
  }


  // addEventListener("click", () => {
  //   console.log(this.hikesTarget.innerText)

  // });

  // change(event) {
  //   displayAlertOnButtonClick = () => {
  //     // TODO: Select the big green button
  //     const button = this.hike_confirm_buttonTarget.action

  //     // TODO: Bind the `click` event to the button
  //     button.addEventListener("click", () => {
  //       alert("Thank you!");
  //     });
  //     // // TODO: On click, display `Thank you!` in a JavaScript alert!
  //   };

  // }
}




// #setInputValue(event) {
//   this.addressTarget.value = event.result["place_name"]
// }

// #clearInputValue() {
//   this.addressTarget.value = ""
// }

// disconnect() {
//   this.geocoder.onRemove()
// }
