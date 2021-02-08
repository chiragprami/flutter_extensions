# extensions

A new Flutter Extension plugin.

### String Extension:

```html
   var email = "chiragprami@gmail.com";
    var isValidEmail = email.isEmail();

    var number = "2500";
    var convertedTODouble = number.convertToDouble();
    var convertedTODoubleWithFraction = number.convertToDouble(fraction: 2);
    var convertedToInt = number.convertToInt();

    String userName;
    var checkIsNullOrNot = userName.nullSafeString();
    var checkUserNameIsNull = userName.isNull();

    var alphaNumber = "9234AA44dd";
    var isAlphanumeric = number.isAlphanumeric();

    var userProfile = "20.20";
    var isValidPercentage = userProfile.isPercentage();
```

### Redirect screen:

```html
   context.redirectTo(child: NewScreen());
```

### PUSH ONLY 

```html
   context.redirectOnly(child: HomeScreen());
```

### HideKeyboard

```html
   context.hideKeyboard();
```

## openDialog

```html
   context.openDialog(child: NewScreen());

```


