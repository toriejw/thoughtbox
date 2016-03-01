$(document).ready(function () {
  viewReadLinks();
  viewUnreadLinks();
  viewAllLinks();
  sortAlphabetically();
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

function sortAlphabetically() {
  $('#filter-options').on('click', '.sort-alphabetically', function () {
    var $links = $('#link-list').find('.link');

    var orderedLinks = $links.sort(function(a, b){
      return $(a).find('h2').text() > $(b).find('h2').text();
    });

    $('#link-list').html(orderedLinks);
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
