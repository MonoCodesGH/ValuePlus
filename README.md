# ValuePlus

**ValuePlus** is a lightweight Luau utility library that provides reusable functions for working with numbers, strings, and tables.

The library is organized into dedicated utility modules for each data type, providing common formatting, validation, manipulation, comparison, and conversion operations without requiring repeated implementation across a project.

`ValuePlus` acts as the primary entry point, exposing the `Number`, `String`, and `Table` utility modules through a single package.

# Features

* Number formatting and validation
* Time, currency, percentage, and ordinal formatting
* Roman numeral conversion
* Compact and comma-separated number formatting
* Random number and chance utilities
* String case conversion
* String validation and searching
* String trimming utilities
* Deep and shallow table copying
* Deep and shallow table merging
* Recursive table comparison
* Recursive table printing
* Table key and value extraction
* Table searching and containment checks
* Table reversal
* Deep table freezing

# Usage

Require `ValuePlus` to access all utility modules:

```lua
const ValuePlus = require("@game/ReplicatedStorage/ValuePlus");
```

Individual utility modules can then be accessed through their respective properties:

```lua
const Number = ValuePlus.Number;
const String = ValuePlus.String;
const Table = ValuePlus.Table;
```

For example:

```lua
print(Number.FormatCommas(1000000)); -- 1,000,000
print(Number.FormatCompact(1500000)); -- 1.5M
print(Number.FormatRoman(2026)); -- MMXXVI
print(String.FormatCamelCase("hello world")); -- helloWorld
print(String.Trim("   Hello World   ")); -- Hello World
print(Table.Contains("hello world", "lo wo)) -- true
```

# API Reference

## Number

The `Number` module provides formatting, validation, percentage, and randomization utilities.

### Formatting

| Method                               | Parameters                             | Returns  | Description                                                                        |
| ------------------------------------ | -------------------------------------- | -------- | ---------------------------------------------------------------------------------- |
| `FormatTime(value)`                  | `value: number`                        | `string` | Formats seconds as `MM:SS`, `HH:MM:SS`, or `DD:HH:MM:SS`.                          |
| `FormatCompact(value)`               | `value: number`                        | `string` | Formats large numbers using compact suffixes such as `K`, `M`, `B`, `T`, and `Qd`. |
| `FormatCommas(value)`                | `value: number`                        | `string` | Adds comma separators to the integer portion of a number.                          |
| `FormatDecimal(value, decimals)`     | `value: number`<br>`decimals: number`  | `string` | Formats a number to a specified number of decimal places.                          |
| `FormatCurrency(value, symbol)`      | `value: number`<br>`symbol: string`    | `string` | Formats a number as currency with two decimal places.                              |
| `FormatPercentage(value, decimals?)` | `value: number`<br>`decimals?: number` | `string` | Formats a number as a percentage.                                                  |
| `FormatOrdinal(value)`               | `value: number`                        | `string` | Converts a number into an ordinal such as `1st`, `2nd`, or `3rd`.                  |
| `FormatRoman(value)`                 | `value: number`                        | `string` | Converts an integer from `1` through `3999` into Roman numerals.                   |

### Validation

| Method             | Parameters      | Returns   | Description                                           |
| ------------------ | --------------- | --------- | ----------------------------------------------------- |
| `IsInteger(value)` | `value: number` | `boolean` | Determines whether a number is an integer.            |
| `IsEven(value)`    | `value: number` | `boolean` | Determines whether a number is even.                  |
| `IsOdd(value)`     | `value: number` | `boolean` | Determines whether a number is odd.                   |
| `GetSign(value)`   | `value: number` | `number`  | Returns `-1`, `0`, or `1` based on the number's sign. |

### Percentage

| Method                          | Parameters                         | Returns  | Description                                             |
| ------------------------------- | ---------------------------------- | -------- | ------------------------------------------------------- |
| `GetPercentage(value, max)`     | `value: number`<br>`max: number`   | `number` | Calculates what percentage `value` represents of `max`. |
| `GetPercentageOf(percent, max)` | `percent: number`<br>`max: number` | `number` | Calculates a value from a percentage and maximum value. |

### Randomization

| Method                  | Parameters                     | Returns   | Description                                                                                   |
| ----------------------- | ------------------------------ | --------- | --------------------------------------------------------------------------------------------- |
| `RandomFloat(min, max)` | `min: number`<br>`max: number` | `number`  | Generates a random float between the specified bounds with three decimal places of precision. |
| `RandomChance(percent)` | `percent: number`              | `boolean` | Returns whether a random percentage check succeeds.                                           |
| `RandomSign()`          | None                           | `number`  | Returns either `-1` or `1` randomly.                                                          |

## String

The `String` module provides formatting, validation, searching, and trimming utilities.

### Formatting

| Method                     | Parameters      | Returns  | Description                                  |
| -------------------------- | --------------- | -------- | -------------------------------------------- |
| `FormatCapitalized(value)` | `value: string` | `string` | Capitalizes the first character of a string. |
| `FormatCamelCase(value)`   | `value: string` | `string` | Converts a string into camelCase.            |
| `FormatSnakeCase(value)`   | `value: string` | `string` | Converts a string into snake_case.           |
| `FormatKebabCase(value)`   | `value: string` | `string` | Converts a string into kebab-case.           |

### Validation

| Method             | Parameters      | Returns   | Description                                               |
| ------------------ | --------------- | --------- | --------------------------------------------------------- |
| `IsEmpty(value)`   | `value: string` | `boolean` | Determines whether a string is empty.                     |
| `IsBlank(value)`   | `value: string` | `boolean` | Determines whether a string contains only whitespace.     |
| `IsNumber(value)`  | `value: string` | `boolean` | Determines whether a string can be converted to a number. |
| `IsInteger(value)` | `value: string` | `boolean` | Determines whether a string represents an integer.        |
| `IsDecimal(value)` | `value: string` | `boolean` | Determines whether a string represents a decimal number.  |

### Searching

| Method                      | Parameters                          | Returns   | Description                                                      |
| --------------------------- | ----------------------------------- | --------- | ---------------------------------------------------------------- |
| `StartsWith(value, prefix)` | `value: string`<br>`prefix: string` | `boolean` | Determines whether a string begins with a specified prefix.      |
| `EndsWith(value, suffix)`   | `value: string`<br>`suffix: string` | `boolean` | Determines whether a string ends with the specified suffix.      |
| `Contains(value, search)`   | `value: string`<br>`search: string` | `boolean` | Determines whether a string contains the specified search value. |

### Trimming

| Method             | Parameters      | Returns  | Description                              |
| ------------------ | --------------- | -------- | ---------------------------------------- |
| `Trim(value)`      | `value: string` | `string` | Removes leading and trailing whitespace. |
| `TrimStart(value)` | `value: string` | `string` | Removes leading whitespace.              |
| `TrimEnd(value)`   | `value: string` | `string` | Removes trailing whitespace.             |

## Table

The `Table` module provides utilities for copying, merging, comparing, searching, inspecting, and manipulating tables.

### Copying

| Method             | Parameters   | Returns | Description                                        |
| ------------------ | ------------ | ------- | -------------------------------------------------- |
| `DeepCopy(tbl)`    | `tbl: table` | `table` | Recursively copies a table and its nested tables.  |
| `ShallowCopy(tbl)` | `tbl: table` | `table` | Copies the top-level entries of a table.           |
| `DeepFreeze(tbl)`  | `tbl: table` | `table` | Recursively freezes a table and all nested tables. |

### Merging

| Method                        | Parameters                        | Returns | Description                                                                            |
| ----------------------------- | --------------------------------- | ------- | -------------------------------------------------------------------------------------- |
| `DeepMerge(first, second)`    | `first: table`<br>`second: table` | `table` | Recursively merges the second table into the first table.                              |
| `ShallowMerge(first, second)` | `first: table`<br>`second: table` | `table` | Creates a copy of the first table and overwrites matching keys using the second table. |

### Comparison

| Method                      | Parameters                        | Returns   | Description                                                                  |
| --------------------------- | --------------------------------- | --------- | ---------------------------------------------------------------------------- |
| `DeepEquals(first, second)` | `first: table`<br>`second: table` | `boolean` | Recursively determines whether two tables contain identical keys and values. |

### Searching

| Method                 | Parameters                   | Returns   | Description                                               |
| ---------------------- | ---------------------------- | --------- | --------------------------------------------------------- |
| `Contains(tbl, value)` | `tbl: table`<br>`value: any` | `boolean` | Determines whether a table contains a specified value.    |
| `Find(tbl, value)`     | `tbl: table`<br>`value: any` | `any?`    | Returns the key associated with the first matching value. |
| `IsEmpty(tbl)`         | `tbl: table`                 | `boolean` | Determines whether a table contains no entries.           |

### Extraction

| Method           | Parameters   | Returns | Description                                                   |
| ---------------- | ------------ | ------- | ------------------------------------------------------------- |
| `GetKeys(tbl)`   | `tbl: table` | `{any}` | Returns an array containing all keys in a table.              |
| `GetValues(tbl)` | `tbl: table` | `{any}` | Returns an array containing all values in a table.            |
| `Reverse(tbl)`   | `tbl: {any}` | `{any}` | Returns a new array containing the elements in reverse order. |

### Debugging

| Method                    | Parameters                        | Returns | Description                                                        |
| ------------------------- | --------------------------------- | ------- | ------------------------------------------------------------------ |
| `DeepPrint(tbl, prefix?)` | `tbl: table`<br>`prefix?: string` | `nil`   | Recursively prints non-table values with their complete key paths. |

# API Structure

ValuePlus exposes its utilities through three primary modules:

```text
ValuePlus
├── Number
├── String
└── Table
```

Each module can be accessed directly from the main `ValuePlus` module:

```lua
ValuePlus.Number
ValuePlus.String
ValuePlus.Table
```

This structure keeps utilities grouped by their associated data type while providing a single import point for the entire library.
