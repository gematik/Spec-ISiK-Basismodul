Invariant: vs-de-3
Description: "If there is no value a data absent reason must be present"
* severity = #error
* expression = "value.exists() xor dataAbsentReason.exists()"