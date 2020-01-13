
document.addEventListener('turbolinks:load', function(){
  $('.form-inline-link').click(formInlineLinkHandler);
  $errors = $('.resource-errors');
  // а это нормальный подход? у нас ведь ошибка может прийти в теории не только от ресурса теста
  if ( $errors.length > 0 ) {
    var resourceId = $errors.data('resourceId'); 
    formInlineHandler(resourceId);
  }

  function formInlineLinkHandler(event){
    event.preventDefault();
    var testId = this.dataset.testId;
    formInlineHandler(testId);
  }

  function formInlineHandler(testId){
    var $link = $('.form-inline-link[data-test-id="' + testId + '"]');
    var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]');
    $testTitle.toggle();
    $formInline.toggle();
    // пока не стал заморачиваться с локалью и подключением i18n-js
    if ( $testTitle.is(':visible') ) {
      $link.text('Edit');
    } else {
      $link.text('Cancel');
    }
  }
})
