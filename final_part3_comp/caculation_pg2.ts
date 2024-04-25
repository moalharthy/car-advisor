// Function to calculate the total price based on selected cars and age
function calculatePrice(): void {
  const age: number = parseInt((document.getElementById('age') as HTMLInputElement).value);
  let totalPrice: number = 0;

  // Loop through all checkboxes to calculate total price of selected cars
  const checkboxes: NodeListOf<HTMLInputElement> = document.querySelectorAll('.carCheckbox:checked');
  checkboxes.forEach((checkbox: HTMLInputElement) => {
    totalPrice += parseFloat(checkbox.value);
  });

  // Apply discount for customers above 60 years old
  if (!isNaN(age) && age >= 60) {
    totalPrice *= 0.9; // 10% discount
  }

  // Display the result
  (document.getElementById('result') as HTMLElement).innerHTML = `
    <p>Total Price: OMR ${totalPrice.toFixed(2)}</p>
  `;
}

// Attach event listener to form submission
document.getElementById('calculationForm')!.addEventListener('submit', function(event: Event) {
  event.preventDefault(); // Prevent default form submission
  calculatePrice(); // Calculate and display the result
});


