$(document).ready(function () {
  changeLinkStatus();
});

function changeLinkStatus() {
  $('#link-list').on('click', '.change-button-status', function () {
    var linkId = $(this).attr('id');
    var buttonContent = $(this).html().split(" ");
    var linkStatus = buttonContent[buttonContent.length - 1];
    var $button = $(this);

    updateLinkStatus(linkId, linkStatus, $button);
  });
}

function updateLinkStatus(id, status, $button) {
  if (status === "read") {
    var isRead = true;
  }
  else {
    var isRead = false;
  }

  var linkParams = { read: isRead };

  $.ajax({
    type: 'PUT',
    url: '/api/v1/link/' + id,
    data: linkParams,
    success: function(response) {
      updateButton(status, $button, id);
    }
  });
}

function updateButton(status, $button, id) {
  updateButtonColor(status, $button);
  updatePageContent(status, id);
}

function updateButtonColor(status, $button) {
  $button.toggleClass('read-button');
  $button.toggleClass('unread-button');
}

function updatePageContent(status, id) {
  if (status === "read") {
    var buttonText = "Mark as unread";
    var statusText = "Status: read";
  } else {
    var buttonText = "Mark as read";
    var statusText = "Status: unread";
  }

  var statusNotice = document.getElementById("status-" + id)
  document.getElementById(id).innerHTML = buttonText;
  statusNotice.innerHTML = statusText;
  
  $(statusNotice).toggleClass('read');
  $(statusNotice).toggleClass('unread');
}
