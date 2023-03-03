validatorInputs(
    {required String? value,
    required int max_length,
    required int min_length,
    required String type}) {
  if (type == 'email') {
    if (value!.isEmpty) {
      return 'email cant be empty';
    } else {
      if (value.length > max_length) {
        return 'email cant be more then $max_length ';
      } else if (value.length < min_length) {
        return 'email cant be less then $min_length ';
      } else {
        bool emailValid =
            RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                .hasMatch(value);
        if (emailValid == false) {
          return 'please enter a valide email';
        }
      }
    }
  } else if (type == 'password') {
    if (value!.isEmpty) {
      return 'password cant be empty';
    } else {
      if (value.length > max_length) {
        return 'password cant be more then $max_length';
      } else if (value.length < min_length) {
        return 'password cant be less then  $min_length';
      }
    }
  }
}
