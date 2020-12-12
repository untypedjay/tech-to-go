# Inheritance
* only single inheritance possible
* if there is no base class, it is derived from `Object`
* public and protected methods will be inherited
* methods that are dynamically bound are declared with the keyword `virtual`
* `virtual` methods can be overwritten with `override` or `new` (`new` is used if exchange of base
class should not have an impact on the functionality -> fragile base class problem)
