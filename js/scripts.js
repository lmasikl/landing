var LandingMap;

function init () {
  // Создание экземпляра карты и его привязка к контейнеру с
  // заданным id ("map").
  LandingMap = new ymaps.Map('map', {
    // При инициализации карты обязательно нужно указать
    // её центр и коэффициент масштабирования.
    center: [55.76, 37.64], // Москва
    zoom: 10,
    controls: ['fullscreenControl', 'zoomControl']
  });
}

// Дождёмся загрузки API и готовности DOM.
ymaps.ready(init);

$(document).ready(function(){
  $('li > a').click(function(){
    this.parent.addClass('active');
  })
});