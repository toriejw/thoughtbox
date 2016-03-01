$(document).ready(function () {
  viewReadLinks();
  viewUnreadLinks();
  viewAllLinks();
});

function viewReadLinks() {
  $('#filter-options').on('click', '.view-read-links', function () {
    var $links = $('#link-list').find('.link');

    $.each($links, function (index, link) {
      showLinkIfRead(link);
    });
  });
}

function viewUnreadLinks() {
  $('#filter-options').on('click', '.view-unread-links', function () {
    var $links = $('#link-list').find('.link');

    $.each($links, function (index, link) {
      showLinkIfUnread(link);
    });
  });
}

function viewAllLinks() {
  $('#filter-options').on('click', '.view-all-links', function () {
    var $links = $('#link-list').find('.link');

    $.each($links, function (index, link) {
      $(link).show();
    });
  });
}

function showLinkIfRead(link) {
  var linkStatus = $(link).find('p').attr('class');

  if (linkStatus === "read") {
    $(link).show();
  } else {
    $(link).hide();
  }
}

function showLinkIfUnread(link) {
  var linkStatus = $(link).find('p').attr('class');

  if (linkStatus === "unread") {
    $(link).show();
  } else {
    $(link).hide();
  }
}
