// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.tipsy

var renderBrazilians = function(container, brazilians) {
  var c = container.empty();

  for(i = 0; i < brazilians.length; i++){
    var b = brazilians[i];
    var t = brazilianTemplate(b.first_name, b.who_is, b.photo_url);
    c.append(t);
  };
};

var brazilianTemplate = function(firstName, whoIs, photoUrl){
  return '<li><a class="brazilian" title="' + whoIs + '"><img src="' + photoUrl + '" alt="Foto do perfil de ' + firstName + '" /></a></li>'
};

var loadTipsy = function(element){
  element.tipsy({gravity: 's', opacity: 1});
};

$(function(){
  loadTipsy($('.brazilian, .logout a'));

  $('.scroller').click(function(){
    $('html, body').animate({ scrollTop: $('.disclaimer').offset().top - 110 }, 700);
    return false;
  });

  $('.entire-list').click(function(){
    $.getJSON('/pages.json', function(brazilians){
      renderBrazilians($('.brazilians'), brazilians);
      loadTipsy($('.brazilian'));
    });
  });

  $(document)
    .ajaxStart(function(){ $('.entire-list').removeAttr('href').text('Carregando lista completa...') })
    .ajaxStop(function(){ $('.total-other-people, .entire-list').remove() });
});
