# Events

- a mechanism for communication between objects
- used in building Loosely Coupled Applications

# Delegates

- agreement / contract between publisher and subscriber
- determines the signature of the event handler method in the subscriber

## Steps to follow

- Define a delegate in the publisher

```csharp
// holds a reference to a function
public delegate void VideoEncodedEventHandler(object sender, EventArgs args);
```

- Define an event based on that delegate

```csharp
public event VideoEncodedEventHandler VideoEncoded;
```

- Raise the event

```csharp
// notifies subscribers
protected virtual void OnVideoEncoded()
{
	if (VideoEncoded != null)
	{
		VideoEncoded(this, EventArgs.Empty);
	}
}
```

## Implementing an Subscriber

```csharp
public class MailService
{
	public void OnVideoEncoded(object sender, EventArgs args)
	{
		Console.WriteLine("Sending an email...");
	}
}
```

## Subscribing

```csharp
videoEncoder.VideoEncoded += mailService.OnVideoEncoded; 
```
