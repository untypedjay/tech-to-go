# Beans
Classes can play different roles. Often, they are used as a datatype, often referenced as a _POJO_ (Plain Old Java Object) or _Bean_.
A bean has the following characteristics:
* public default constructor (automatic by compiler or explicit if more than one constructor)
* needs to implement the interface `Serializable`
* all attributes are private and are accessed through getter and setter methods

## `PropertyChangeListener`
```java
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

public class Person {
  private String name;
  private boolean single = true;
  private PropertyChangeSupport singleInfo = new PropertyChangeSupport(this);
  public static final String SINGLE = "single";
  
  public void addSingleListener(PropertyChangeListener listener) {
    singleInfo.addPropertyChangeListener(SINGLE, listener);
  }
  
  public void setSingle(boolean newStatus) {
    singleInfo.firePropertyChange(SINGLE, this.single, newStatus);
    this.single = newStatus;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public String getName() {
    return this.name;
  }
}
```

Subscriber need to implement `PropertyChangeListener`.

```java
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

public class MarriageCandidates implements PropertyChangeListener {
  public void add(Person person) {
    person.addSingleListener(this);
  }
  
  @Override
  public void propertyChange(PropertyChangeEvent evt) {
    Person person = (Person) evt.getSource();
    System.out.println(person.getName() + " Attribute: " + evt.getPropertyName() + " was: " + evt.getOldValue() + " now: " + evt.getNewValue());
  }
}
```
