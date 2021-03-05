# Beans
Classes can play different roles. Often, they are used as a datatype, often referenced as a _POJO_ (Plain Old Java Object) or _Bean_.
A bean has the following characteristics:
* public default constructor (automatic by compiler or explicit if more than one constructor)
* needs to implement the interface `Serializable`
* all attributes are private and are accessed through getter and setter methods
