document.addEventListener('turbolinks:load', function(){
  var confirmation = document.querySelector('#user_password_confirmation');
  if (confirmation) { confirmation.addEventListener('input', checkPasswordConfirmation); }

  function checkPasswordConfirmation() {
    if (comparePasswordFields()) {
      this.parentNode.querySelector('.octicon-issue-opened').classList.add('hide');
      this.parentNode.querySelector('.octicon-issue-closed').classList.remove('hide');
    } else {
      this.parentNode.querySelector('.octicon-issue-closed').classList.add('hide');
      this.parentNode.querySelector('.octicon-issue-opened').classList.remove('hide');
    }
    if (!confirmation.value) {
      this.parentNode.querySelector('.octicon-issue-opened').classList.add('hide');
      this.parentNode.querySelector('.octicon-issue-closed').classList.add('hide');
    }
  }

  function comparePasswordFields() {
    return document.querySelector('#user_password').value == document.querySelector('#user_password_confirmation').value;
  }
})
