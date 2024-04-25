// Selecting DOM elements
const scrambledWordDisplay = document.querySelector(".word"), // Display for scrambled word
      hintDisplay = document.querySelector(".hint span"), // Display for hint
      timeDisplay = document.querySelector(".time b"), // Display for countdown timer
      userInput = document.querySelector("input"), // Input field for user's word
      refreshButton = document.querySelector(".refresh-word"), // Button to refresh word
      checkButton = document.querySelector(".check-word"), // Button to check user's word
      contentContainer = document.querySelector(".container .content"), // Container for game content
      startButtonArea = document.querySelector(".startArea"), // Area for start button
      scoreDisplay = document.querySelector(".score"), // Display for score
      modalContentArea = document.querySelector(".modal-content"); // Area for modal content

// Get references to modal elements
var modal = document.getElementById("myModal"); // Modal element
var modalCloseButton = document.getElementsByClassName("close")[0]; // Close button for modal
var modalTextContent = document.getElementById("modalText"); // Content area of modal

let correctWord, gameTimer; // Variables to store correct word and game timer
let score = 0; // Variable to store score

// Function to check the user's input word
const checkWord = () => {
    let userWord = userInput.value.toLowerCase(); // Get user's input and convert to lowercase

    // If user doesn't input anything
    if (!userWord) { 
        // Display modal with message
        modal.style.display = "block";
        modalContentArea.classList.remove("modal-wrong");
        modalContentArea.classList.remove("modal-correct");
        return modalTextContent.innerHTML = `<br>Please enter a word to check!`;
    }

    // If user's input doesn't match correct word
    if (userWord !== correctWord) { 
        // Reduce score if score is greater than or equal to 1
        if (score >= 1) {
            score = score - 1; 
            scoreDisplay.innerHTML = score;
        }
        // Display modal with wrong answer message
        modal.style.display = "block";
        modalContentArea.classList.add("modal-wrong");
        return modalTextContent.innerHTML = `<br>Oops! <b>${userWord}</b> is not correct.`;
    } else {
        // If user's input matches correct word, increase score
        modal.style.display = "block";
        modalContentArea.classList.remove("modal-wrong");
        modalContentArea.classList.add("modal-correct");
        modalTextContent.innerHTML = `<br>Congratulations! <b>${correctWord.toUpperCase()}</b> is correct.`;
        score++;
    }
  
    initGame(); // Initialize new game round
};

// Event listener for the check word button
checkButton.addEventListener("click", checkWord);

// Function to initialize the countdown timer
const initTimer = maxTime => {
    clearInterval(gameTimer); // Clear any existing timers
    gameTimer = setInterval(() => { // Start new timer
        if(maxTime > 0) {
            maxTime--; // Decrement time
            return timeDisplay.innerText = maxTime; // Update timer display
        }
        // Display modal when time is up
        modal.style.display = "block";
        modalContentArea.classList.add("modal-wrong");
        modalTextContent.innerHTML = `<br>Time's up! The correct word was <b>${correctWord.toUpperCase()}</b>`;
        endGame(); // Handle end of game
    }, 1000); // Timer interval: 1 second
};

// Function to start the game
const start = () => {
    contentContainer.style.display = "block"; // Show game content container
    startButtonArea.style.display = "none"; // Hide start button area
    initGame(); // Initialize game
};

// Function to handle end of game
const endGame = () => {
    clearInterval(gameTimer); // Clear timer
    contentContainer.style.display = "none"; // Hide game content
    startButtonArea.style.display = "block"; // Show start button area
    modal.style.display = "block"; // Display modal
    modalContentArea.classList.remove("modal-correct"); // Remove 'correct' class
    modalContentArea.classList.add("modal-wrong"); // Add 'wrong' class
    modalTextContent.innerHTML = `
    <center><br>Time's up! The correct word was <b>${correctWord.toUpperCase()}</b>.
    <br>You Lost The Game! :(</center><br>
    </center>
    `; // Set modal content
};

// Function to handle winning the game
const winGame = () => {
    clearInterval(gameTimer); // Clear timer
    contentContainer.style.display = "none"; // Hide game content
    startButtonArea.style.display = "block"; // Show start button area
    modal.style.display = "block"; // Display modal
    modalContentArea.classList.add("modal-correct"); // Add 'correct' class
    modalTextContent.innerHTML = `<br><center>Congratulations! You WIN THE GAME !!!!!!`; // Set modal content
};

// Function to initialize a new game round
const initGame = () => {
    initTimer(30); // Initialize timer with 30 seconds
    let randomWordObj = words[Math.floor(Math.random() * words.length)]; // Get random word object
    let wordArray = randomWordObj.word.split(""); // Split word into array of characters
    for (let i = wordArray.length - 1; i > 0; i--) { // Shuffle word array
        let j = Math.floor(Math.random() * (i + 1));
        [wordArray[i], wordArray[j]] = [wordArray[j], wordArray[i]];
    }
    
    scrambledWordDisplay.innerText = wordArray.join(""); // Display scrambled word
    hintDisplay.innerText = randomWordObj.hint; // Display hint
    correctWord = randomWordObj.word.toLowerCase(); // Set correct word
    userInput.value = ""; // Clear user input
    userInput.setAttribute("maxlength", correctWord.length); // Set maximum input length
    scoreDisplay.innerHTML = score; // Update score display

    // Check if the player has reached the winning score
    if(score > 9) {
        winGame(); // Handle winning the game
    }
};

// Close modal when clicking on the close button
modalCloseButton.onclick = function() {
    modal.style.display = "none";
};

// Close modal when clicking anywhere outside of it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};

// Event listener for the refresh button
refreshButton.addEventListener("click", initGame);
