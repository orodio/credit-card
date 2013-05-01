# language: en
Feature: Credit Card

  Scenario Outline: Credit Card number gets cleanned up
    Given Credit card with number of <raw_number>
    Then Credit card number is <number>

    Examples:
      | raw_number          | number           | description |
      | 4111111111111111    | 4111111111111111 | base        |
      | 4111 1111 1111 1111 | 4111111111111111 | spaces      |
      | 4111-1111-1111-1111 | 4111111111111111 | dashes      |
      | 4111,1111,1111,1111 | 4111111111111111 | commas      |
      | 4111_1111_1111_1111 | 4111111111111111 | underscores |

  Scenario Outline: Credit Card type and valid
    Given Credit card with number of <number>
    Then Credit card type is <type>
    And Credit card is valid? <valid>
    And Credit card output is <type>: <number> (<valid>)

    Examples:
      | number            | type       | valid   | description                  |
      | 4111111111111111  | VISA       | valid   | golden path                  |
      | 4012888888881881  | VISA       | valid   | golden path                  |
      | 378282246310005   | AMEX       | valid   | golden path                  |
      | 6011111111111117  | Discover   | valid   | golden path                  |
      | 5105105105105100  | MasterCard | valid   | golden path                  |

      | 4111111111111     | VISA       | invalid | not long enough              |
      | 41111111111111111 | Unknown    | invalid | to long                      |
      | 5105105105105106  | MasterCard | invalid | luhn                         |
      | 9111111111111111  | Unknown    | invalid | unknown Card but passes luhn |
      | 9211111111111111  | Unknown    | invalid | unknown Card but fails luhn  |