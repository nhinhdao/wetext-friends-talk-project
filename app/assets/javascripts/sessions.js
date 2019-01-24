
$(function () {
  allEventsListener();
})

function openMessage() {
  document.getElementById("popupMessage").innerHTML = message; 
  $.get('/all_messages', function (message) {
    debugger;
      var list = $('div#games').text()
      for (var i = 0; i < games.data.length; i++) {
        let date = new Date(games.data[i].attributes['updated-at']);
        let update = date.toUTCString();
        let id = games.data[i].id;
        if (!list.includes(id)) {
          var html = '<button data-id="' + id + '">Game: ' + id + ' - Updated at: ' + update + '</button><br>';
          $('div#games').append(html);
          turn = turn_count();
          $(`button[data-id=${id}]`).on('click', showBoard)
        }
      }
  })
}