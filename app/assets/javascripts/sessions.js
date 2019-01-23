let popupStyle = document.getElementById("popupMessage").style;

$(function () {
  allEventsListener();
})

function allOn() {
  let win = window.open('http://www.yahoo.com', 'windowname', 'width=1,height=1,left=5,top=3');
  setTimeout(function () { win.close(); }, 3000);
}

function showPopup(message) {
  document.getElementById("popupMessage").innerHTML = message; 
  popupStyle.display = none;
}