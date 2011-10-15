function updateChat() {
  $.get('/lines?chat_id=' + $('#chat').attr('guid'), function(data) {
    $('#chat').html(data);
  });
};

$('document').ready( function () {
    setInterval('updateChat()', 5000);
  }
);
