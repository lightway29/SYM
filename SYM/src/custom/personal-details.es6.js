console.log('ES6 hello!');

class PersonDetail {
  constructor() {
    let $submitButton = $('#form-submit');
    this.$formSubmitButton = $submitButton
    ;
    this.emailRequiredText = "Please enter an email address.";
    this.emailFormatText = "Your email address must be in the format of name@domain.com.";
    this.nameInvalidChars = "Your name may only contain letters and spaces.";
    this.phoneInvalidChars = "Your phone number may only contain a combination of digits, +, -, (, ), and spaces.";
    this.submitted = false;
  }
}

$(function() {
  if ($.validator) {
    /**
     * Extend our validation for name.
     * @return boolean
     */
    $.validator.addMethod('nameRegEx', function (value, element) {
      return this.optional(element) || !(/[^A-Za-z\-\ ]/.test(value));
    });

    /**
     * Validate phone numbers.
     * @return boolean
     */
    $.validator.addMethod('phoneRegEx', function (value, element) {
      return this.optional(element) || !(/[^\d\+\(\)\- ]+/.test(value));
    });
  }

  console.log(new PersonDetail());
});
