console.log('ES6 hello!')

class PersonDetail {
  constructor() {
    let $submitButton = $('#form-submit');

    this.$formSubmitButton = $submitButton;
    this.emailRequiredText = "Please enter an email address.";
    this.emailFormatText = "Your email address must be in the format of name@domain.com.";
    this.nameInvalidChars = "Your name may only contain letters and spaces.";
    this.phoneInvalidChars = "Your phone number may only contain a combination of digits, +, -, (, ), and spaces.";
    this.submitted = false;
  }
}

let person = new PersonDetail();
console.log(person.emailFormatText);
