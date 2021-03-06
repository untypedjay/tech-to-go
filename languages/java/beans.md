# Beans
Classes can play different roles. Often, they are used as a datatype, often referenced as a _POJO_ (Plain Old Java Object) or _Bean_.
A bean has the following characteristics:
* public default constructor (automatic by compiler or explicit if more than one constructor)
* needs to implement the interface `Serializable`
* all attributes are private and are accessed through getter and setter methods

## Bound Properties
Notify subscribed clients when property changes.
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

## Events
1. define event object
```java
import java.util.EventObject;

public class ClockEvent extends EventObject {
  protected long timeStamp;
  public ClockEvent(Object source, long timeStamp) {
    super(source);
    this.timeStamp = timeStamp;
  }
  public long getTimeStamp() {
    return timeStamp;
  }
}
```
2. define event interface
```java
public interface ClockListener extends EventListener {
  void clockTicked(ClockEvent e);
  void timerExpired(ClockEvent e);
}
```
3. define adapter (optional)
```java
public class ClockAdapter implements ClockListener {
  @Override
  public void clockTicked(ClockEvent e) {}
  @Override
  public void timerExpired(ClockEvent e) {}
}
```
4. implement methods to subscribe and unsubscribe clients and fire event in event source
```java
public class Clock {
  private List<ClockListener> clockListeners = new CopyOnWriteArrayList<ClockListener>();
  private long timeStamp;
  public Clock(long timeStamp) {
    this.timeStamp = timeStamp;
  }
  public void addClockListener(ClockListener l) {
    clockListeners.add(l);
  }
  public void removeClockListener(ClockListener l) {
    clockListeners.remove(l);
  }
  private void fireTickEvent() {
    ClockEvent event = new ClockEvent(this.timeStamp);
    for (ClockListener listener : clockListeners) {
      listener.clockTicked(event);
    }
  }
}
```

5. implement event client
```java
public class ClockClient {
  private Clock clock;
  public ClockClient() {
    clock = new Clock(currentTime);
    clock.addClockListener(new ClockListener() {
      @Override
      public void clockTicked(ClockEvent e) {
        System.out.println("Clock tick: " + e.getTimestamp());
      }
      @Override
      public void timerExpired(ClockEvent e) {
        System.out.println("Timer event: " + e.getTimestamp());
      }
    });
  }
}
```
