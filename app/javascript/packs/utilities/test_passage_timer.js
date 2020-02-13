// думал для удовлетворения ТЗ по безопасности таймера использовать другое событие turbolinks вместо load 
document.addEventListener('turbolinks:load', function(){
  const ms_in_second = 1000
  const ms_in_minute = 60000
  const ms_in_hour = ms_in_minute * 60 
  const minutes_in_hour = 60 
  const seconds_in_minute = 60 
  // вроде удовлетворил требования по защите таймера от измений пользователем
  // за счет присваивания значений только один раз после загрузки страницы 
  // немного грязно, тк были в проблемы с variable has been optimized out 
  let date_limit = new Date($('#start-time').first().text() * ms_in_second + $('#time-minutes').first().text() * ms_in_minute)
  // КАК лучше ограничивать выполнение скрипта на страницах для которых он не предназначен? 
  if ($('.timer').length > 0) {
    setTimeout(redirect_to_result, $('#time-minutes').first().text() * ms_in_minute)
    setInterval(render_clock, ms_in_second)
  }

  function redirect_to_result() {
    location.replace(location + '/result')
  }

  function render_clock() {
    $('.clock').text(build_countdown_text(Date.now()))
  }

  function build_countdown_text(time_now) {
    let time_left = date_limit - time_now 
    let hours = Math.floor(time_left / ms_in_hour)
    let minutes = Math.floor(time_left / ms_in_minute) - hours * minutes_in_hour
    let seconds = Math.floor(time_left / ms_in_second) - (minutes + hours * minutes_in_hour) * seconds_in_minute
    if (minutes < 10) {
      minutes = '0' + minutes 
    }
    if (seconds < 10) {
      seconds = '0' + seconds 
    }
    if (hours < 0) {
      return '0:00:00'
    }
    return `${hours}:${minutes}:${seconds}`
  }
})
