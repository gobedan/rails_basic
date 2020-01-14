document.addEventListener('turbolinks:load', function(){
  var progress_container = document.querySelector('.progress-container');
  if (progress_container) {
    var bar_status = document.querySelector('.bar-status');
    let status_width_percent = 100 * progress_container.dataset.questionNumber / progress_container.dataset.questionsCount;
    bar_status.setAttribute("style", "width: " + status_width_percent + "%");
  }
})
