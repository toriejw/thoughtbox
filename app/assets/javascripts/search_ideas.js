$(document).ready(function () {
  searchIdeas();
});

function searchIdeas() {
  $('#filter-bar').keyup(function(){
    filterIdeas($('#filter-bar').val());
  });
}

function filterIdeas(searchQuery) {
  var $links = $('#link-list').find('.link')

  $.each($links, function (index, link) {
    showIdeaIfSearched(link, searchQuery);
  });
}

function showIdeaIfSearched(link, searchQuery) {
  var title = $(link).find('.link-title').text();
  var url = $(link).find('.link-url').text();

  if (title.indexOf(searchQuery) >= 0 || url.indexOf(searchQuery) >= 0) {
    $(link).show();
  } else {
    $(link).hide();
  }
}
