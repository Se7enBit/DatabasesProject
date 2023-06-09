function toggleInputs() {
    const yearCheckbox = document.querySelector('input[name="yearCheckbox"]');
    const monthCheckbox = document.querySelector('input[name="monthCheckbox"]');
    const yearInput = document.getElementById('yearInput');
    const monthInput = document.getElementById('monthInput');

    if (yearCheckbox.checked) {
      yearInput.style.display = 'block';
      monthInput.style.display = 'none';
      monthCheckbox.checked = false;
    } else if (monthCheckbox.checked) {
      yearInput.style.display = 'none';
      monthInput.style.display = 'block';
      yearCheckbox.checked = false;
    } else {
      yearInput.style.display = 'none';
      monthInput.style.display = 'none';
    }
}

function toggleInputs2() {
  const titleCheckbox = document.querySelector('input[name="titleCheckbox"]');
  const categoryCheckbox = document.querySelector('input[name="categoryCheckbox"]');
  const writerCheckbox = document.querySelector('input[name="writerCheckbox"]');
  const copiesCheckbox = document.querySelector('input[name="copiesCheckbox"]');
  const titleInput = document.getElementById('titleInput');
  const categoryInput = document.getElementById('categoryInput');
  const writerInput = document.getElementById('writerInput');
  const copiesInput = document.getElementById('copiesInput');

  if (titleCheckbox.checked) {
    titleInput.style.display = 'block';
    writerInput.style.display = 'none';
    writerCheckbox.checked = false;
    copiesInput.style.display = 'none';
    copiesCheckbox.checked = false;
    categoryInput.style.display = 'none';
    categoryCheckbox.checked = false;
  } 
  
  else if (categoryCheckbox.checked) {
    titleCheckbox.checked = false;
    titleInput.style.display = 'none';
    writerInput.style.display = 'none';
    writerCheckbox.checked = false;
    copiesInput.style.display = 'none';
    copiesCheckbox.checked = false;
    categoryInput.style.display = 'block';
  } 
  
  else if (writerCheckbox.checked){
    titleCheckbox.checked = false;
    titleInput.style.display = 'none';
    writerInput.style.display = 'block';
    copiesInput.style.display = 'none';
    copiesCheckbox.checked = false;
    categoryInput.style.display = 'none';
    categoryCheckbox.checked = false;
  }

  else if (copiesCheckbox.checked) {
    titleCheckbox.checked = false;
    titleInput.style.display = 'none';
    writerInput.style.display = 'none';
    writerCheckbox.checked = false;
    copiesInput.style.display = 'block';
    categoryCheckbox.checked = false;
    categoryInput.style.display = 'none';
  }

  else {
    titleInput.style.display = 'none';
    categoryInput.style.display = 'none';
    copiesInput.style.display = 'none';
    writerInput.style.display = 'none';
  }

}

function toggleInputs3() {
  const userCheckbox = document.querySelector('input[name="userCheckbox"]');
  const categoryCheckbox = document.querySelector('input[name="categoryCheckbox2"]');
  const userInput = document.getElementById('userInput');
  const categoryInput = document.getElementById('categoryInput2');

  if (userCheckbox.checked) {
    categoryInput.style.display = 'none';
    userInput.style.display = 'block';
    categoryCheckbox.checked = false;
  } 

  else if (categoryCheckbox.checked) {
    userInput.style.display = 'none';
    categoryInput.style.display = 'block';
    userCheckbox.checked = false;
  } 
  
  else {
    userInput.style.display = 'none';
    categoryInput.style.display = 'none';
  }
}

function searchOptions() {
  const titleCheckbox = document.querySelector('input[value="titleCheckbox"]');
  const categoryCheckbox = document.querySelector('input[value="categoryCheckbox"]');
  const writerCheckbox = document.querySelector('input[value="writerCheckbox"]');
  const tilteInput = document.getElementById('titleInput');
  const categoryInput = document.getElementById('categoryInput');
  const writerInput = document.getElementById('writerInput');
  const search = document.getElementById('search');

  if(titleCheckbox.checked) {
    titleInput.style.display = 'block';
    categoryInput.style.display = 'none';
    writerInput.style.display = 'none';
    search.style.display = 'block';
  }
  else if(categoryCheckbox.checked) {
    titleInput.style.display = 'none';
    categoryInput.style.display = 'block';
    writerInput.style.display = 'none';
    search.style.display = 'block';
  }
  else if(writerCheckbox.checked) {
    titleInput.style.display = 'none';
    categoryInput.style.display = 'none';
    writerInput.style.display = 'block';
    search.style.display = 'block';
  }
}