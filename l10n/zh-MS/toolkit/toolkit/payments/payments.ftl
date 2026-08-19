

credit-card-expiration = 期满在 { $month }/{ $year }


credit-card-label-number-2 = { $number }
    .aria-label = { $type } { credit-card-label-number-2 }

credit-card-label-number-name-2 = { $number }, { $name }
    .aria-label = { $type } { credit-card-label-number-name-2 }

credit-card-label-number-expiration-2 = { $number }, { credit-card-expiration }
    .aria-label = { $type } { credit-card-label-number-expiration-2 }

credit-card-label-number-name-expiration-2 =
  { $number }, { $name }, { credit-card-expiration }
    .aria-label = { $type } { credit-card-label-number-name-expiration-2 }
