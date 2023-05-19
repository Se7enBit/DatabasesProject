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