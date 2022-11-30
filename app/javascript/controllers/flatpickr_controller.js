import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime", "totalPrice" ]

  price = document.getElementById("price")
  total = document.getElementById("total-price")


  connect() {
    flatpickr(this.startTimeTarget, {})
    flatpickr(this.endTimeTarget, {})
    console.log(price.dataset.price)
  }

  totalPrice = (days) => {
    this.totalPriceTarget.innerHTML = days * price.dataset.price
  }


  input(event) {
    console.log(event.target.value)
    // days from endTime to startTime
    const days = (new Date(this.endTimeTarget.value) - new Date(this.startTimeTarget.value)) / (1000 * 60 * 60 * 24)
    console.log(days)
    console.log("total price: ", days * price.dataset.price)
    // change the price value
    if (days > 0) {
      this.totalPrice(days)
      // show the total price
      this.total.classList.remove("d-none")
    }

  }


}
