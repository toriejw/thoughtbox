$(document).ready(function () {
  searchLinks();
});

function searchLinks() {
  $('#filter-bar').keyup(function(){
    filterLinks($('#filter-bar').val());
  });
}

function filterLinks(searchQuery) {
  var $links = $('#link-list').find('.link')

  $.each($links, function (index, link) {
    showLinkIfSearched(link, searchQuery);
  });
}

function showLinkIfSearched(link, searchQuery) {
  var title = $(link).find('.link-title').text();
  var url = $(link).find('.link-url').text();

  if (title.indexOf(searchQuery) >= 0 || url.indexOf(searchQuery) >= 0) {
    $(link).show();
  } else {
    $(link).hide();
  }
}
