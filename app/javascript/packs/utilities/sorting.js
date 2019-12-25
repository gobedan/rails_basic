document.addEventListener('turbolinks:load', function(){
  // нормально что в скринкасте везде var а не let ?
  var control = document.querySelector('.sort-by-title');
  if (control) { control.addEventListener('click', sortTestsByTitle); }

  function sortTestsByTitle() {
    // Насколько корректный нейминг? В тч css классов
    var testsBlock = document.querySelector('.tests-block');
    var testContainers = testsBlock.querySelectorAll('.test-container');
    var sortedContainers = Array.from(testContainers);
    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedContainers.sort(compareContainersAsc);
      this.querySelector('.octicon-arrow-up').classList.remove('hide');
      this.querySelector('.octicon-arrow-down').classList.add('hide');
    } else {
      sortedContainers.sort(compareContainersDesc);
      this.querySelector('.octicon-arrow-down').classList.remove('hide');
      this.querySelector('.octicon-arrow-up').classList.add('hide');
    }
    var sortedBlock = document.createElement('div'); 
    sortedBlock.classList = testsBlock.classList;
    for (var i = 0; i < sortedContainers.length; i++) {
      sortedBlock.appendChild(sortedContainers[i]);
    }
    testsBlock.parentNode.replaceChild(sortedBlock, testsBlock);
  }

  function compareContainersAsc(div1, div2) {
    var testTitle1 = div1.querySelector('p').textContent;
    var testTitle2 = div2.querySelector('p').textContent;
    if (testTitle1 < testTitle2) { return -1; }
    if (testTitle1 > testTitle2) { return 1; }
    return 0;
  }

  function compareContainersDesc(div1, div2) {
    var testTitle1 = div1.querySelector('p').textContent;
    var testTitle2 = div2.querySelector('p').textContent;
    if (testTitle1 < testTitle2) { return 1; }
    if (testTitle1 > testTitle2) { return -1; }
    return 0;
  }

})
