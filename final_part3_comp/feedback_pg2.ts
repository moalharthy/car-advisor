document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('questionnaire') as HTMLFormElement;

    form.addEventListener('submit', (event: Event) => {
        event.preventDefault();
        if (validate()) {
            alert('Form submitted successfully!');
            form.reset();
        }
    });

    function validate(): boolean {
        const nameInput = document.getElementById('name') as HTMLInputElement;
        const country = document.getElementById('country') as HTMLSelectElement;
        const experience = document.getElementById('experience') as HTMLSelectElement;
        const comments = document.getElementById('comments') as HTMLTextAreaElement;
        const ratingInputs = document.querySelectorAll<HTMLInputElement>('input[name="rating"]');
        let ratingChecked = false;
        const ageInputs = document.querySelectorAll<HTMLInputElement>('input[name="age"]');
        let ageChecked = false;

        // Name validation: should contain only alphabets and spaces
        const nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(nameInput.value)) {
            alert('Please enter a valid name.');
            nameInput.focus();
            return false;
        }
        // Age validation: at least one age should be checked
        ageInputs.forEach(input => {
            if (input.checked) {
                ageChecked = true;
            }
        });

        if (!ageChecked) {
            alert('Please select your age.');
            return false;
        }

        // Experience validation: should not be "Select"
        if (experience.value === '') {
            alert('Please select your experience.');
            experience.focus();
            return false;
        }
        if (comments.value.trim() === "") {
            alert('Please write your comment');
            comments.focus();
            return false;
        }

        // Rating validation: at least one rating should be checked
        ratingInputs.forEach(input => {
            if (input.checked) {
                ratingChecked = true;
            }
        });

        if (!ratingChecked) {
            alert('Please rate the website out of 10.');
            return false;
        }

        return true;
    }

    // Function to get current time and display it
    function getCurrentTime() {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const timeString = `${hours}:${minutes}`;
        document.getElementById('current-time')!.innerText = 'Current Time: ' + timeString;
    }

    // Call getCurrentTime function initially and every second
    getCurrentTime();
    setInterval(getCurrentTime, 1000);
});


