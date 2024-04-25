
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('questionnaireForm');
    
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        if (validateForm()) {
            // Submit form data to server
            alert('Form submitted successfully!');
            form.reset();
        }
    });

    function validateForm() {
        const nameInput = document.getElementById('name');
        const experienceInput = document.getElementById('experience');

        // Name validation: should contain only alphabets and spaces
        const nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(nameInput.value)) {
            alert('Please enter a valid name.');
            nameInput.focus();
            return false;
        }

        // Experience validation: should not be "Select"
        if (experienceInput.value === '') {
            alert('Please select your experience.');
            experienceInput.focus();
            return false;
        }

        return true;
    }
});
