document.addEventListener('turbolinks:load', function(){
  // нормально что в скринкасте везде var а не let ?
  var control = document.querySelector('.sort-by-title');
  control.addEventListener('click', sortTestsByTitle);

  function sortTestsByTitle() {
    // Насколько корректный нейминг? В тч css классов
    var testsBlock = document.querySelector('.tests-block');
    var testContainers = testsBlock.querySelectorAll('.test-container');
    var sortedContainers = Array.from(testContainers).sort(compareContainers);
    var sortedBlock = document.createElement('div'); 
    sortedBlock.classList = testsBlock.classList;
    for (var i = 0; i < sortedContainers.length; i++) {
      sortedBlock.appendChild(sortedContainers[i]);
    }
    testsBlock.parentNode.replaceChild(sortedBlock, testsBlock);
  }

  function compareContainers(div1, div2){
    var testTitle1 = div1.querySelector('p').textContent;
    var testTitle2 = div2.querySelector('p').textContent;
    if (testTitle1 < testTitle2) { return -1; }
    if (testTitle1 > testTitle2) { return 1; }
    return 0;
  }

})
