// Define object types for car events and car news
function CarEvent(name, date, place) {
    this.name = name;
    this.date = date;
    this.place = place;
  }
  
  function CarNews(model, owner, contact) {
    this.model = model;
    this.owner = owner;
    this.contact = contact;
  }
  
  // Initialize arrays with actual information
  var carEvents = [
    new CarEvent("Auto Show 2024", "May 15-20, 2024", "New York City"),
    new CarEvent("Race Car Expo", "June 10-12, 2024", "Los Angeles"),
    new CarEvent("Electric Vehicle Symposium", "July 5-8, 2024", "San Francisco"),
    new CarEvent("Classic Car Rally", "August 20-22, 2024", "London")
  ];
  
  var carNews = [
    new CarNews("Porsche 911 GT3 RS", "John Doe", "john.doe@example.com"),
    new CarNews("Chevrolet Silvarado", "Jane Smith", "jane.smith@example.com"),
    new CarNews("Hyundai Elantra", "Michael Johnson", "michael.johnson@example.com"),
    new CarNews("Toyota Supra", "Sarah Brown", "sarah.brown@example.com"),
    new CarNews("Nissan Skyline GTR", "David Lee", "david.lee@example.com"),
    new CarNews("Honda Civic", "Emily Wilson", "emily.wilson@example.com")
  ];
  
  // Function to display car events in the table
  function displayCarEvents() {
    var tableBody = document.getElementById("carEventsTable").getElementsByTagName("tbody")[0];
    tableBody.innerHTML = "";
    carEvents.forEach(function(event) {
      var row = tableBody.insertRow();
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var cell3 = row.insertCell(2);
      cell1.textContent = event.name;
      cell2.textContent = event.date;
      cell3.textContent = event.place;
    });
  }
  
  // Function to display car news in the table
  function displayCarNews() {
    var tableBody = document.getElementById("carNewsTable").getElementsByTagName("tbody")[0];
    tableBody.innerHTML = "";
    carNews.forEach(function(news) {
      var row = tableBody.insertRow();
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var cell3 = row.insertCell(2);
      cell1.textContent = news.model;
      cell2.textContent = news.owner;
      cell3.textContent = news.contact;
    });
  }
  
  // Function to search for car events by name
  function searchCarEvent() {
    var input = document.getElementById("carEventSearch").value;
    var filteredEvents = carEvents.filter(function(event) {
      return event.name.toLowerCase().includes(input.toLowerCase());
    });
    var tableBody = document.getElementById("carEventsTable").getElementsByTagName("tbody")[0];
    tableBody.innerHTML = "";
    filteredEvents.forEach(function(event) {
      var row = tableBody.insertRow();
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var cell3 = row.insertCell(2);
      cell1.textContent = event.name;
      cell2.textContent = event.date;
      cell3.textContent = event.place;
    });
  }
  
  // Function to search for car news by model
  function searchCarNews() {
    var input = document.getElementById("carNewsSearch").value;
    var filteredNews = carNews.filter(function(news) {
      return news.model.toLowerCase().includes(input.toLowerCase());
    });
    var tableBody = document.getElementById("carNewsTable").getElementsByTagName("tbody")[0];
    tableBody.innerHTML = "";
    filteredNews.forEach(function(news) {
      var row = tableBody.insertRow();
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var cell3 = row.insertCell(2);
      cell1.textContent = news.model;
      cell2.textContent = news.owner;
      cell3.textContent = news.contact;
    });
  }
  
  // Initial display of car events and car news
  displayCarEvents();
  displayCarNews();
  



// Function to display search results
function displaySearchResults(results, tableId) {
    var tableBody = document.getElementById(tableId).getElementsByTagName("tbody")[0];
    tableBody.innerHTML = "";
  
    if (results.length === 0) {
      var row = tableBody.insertRow();
      var cell = row.insertCell(0);
      cell.colSpan = 3;
      cell.textContent = "No results found.";
    } else {
      results.forEach(function(item) {
        var row = tableBody.insertRow();
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        cell1.textContent = item.name || item.model;
        cell2.textContent = item.date || item.owner;
        cell3.textContent = item.place || item.contact;
      });
    }
  }