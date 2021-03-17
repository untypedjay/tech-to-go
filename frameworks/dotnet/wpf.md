# Windows Presentation Foundation
WPF namespace: `System.Windows`
## Architecture
A WPF applications needs the following libraries:
* PresentationFramework.dll: control elements, styling, text, images, animation, ...
* PresentationCore.dll: visual, drawing, brush; implements a visual tree
* WindowsBase.dll: DispatcherObject, DependencyObject (for dependency properties, e. g. to implement MVVM)

## XAML
Declarative Programming: User Interfaces can be written in XAML (eXtensible Application Markup Language)
```xaml
<Window x:Class="XamlExperiments.SimpleDialog"
  xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
  xmlns:x="http://.../xaml"
  Title="XamlExperiments"
  Height="107"
  Width="200"
>
  <Grid>
    <Label
      Height="25"
      HorizontalAlignment="Left"
      Margin="20,15,0,0"
      Name="label"
      VerticalAlignment="Top"
      Width="60"
    >
      Name:
    </Label>
    <TextBox
      Height="25"
      Margin="80,15,10,0"
      Name="textBox"
      VerticalAlignment="Top"
      Padding="5,5,5,5"
    >
      Hello
    </TextBox>
    <Button
      Margin="0,0,0,10"
      Name="button"
      Height="23"
      VerticalAlignment="Bottom"
      HorizontalAlignment="Center"
      Width="80"
    >
      Ok
    </Button>
  </Grid>
</Window>
```

```xaml
<DataTemplate DataType="{x:Type model:Message}">
    <DockPanel LastChildFill="True" Margin="0,0,0,20">
        <Image DockPanel.Dock="Left"
               Width="50"
               Height="50"
               VerticalAlignment="Top"
               Margin="0,0,5,0"
               Source="{Binding TODO}"
        />

        <StackPanel DockPanel.Dock="Top" Orientation="Horizontal">
            <TextBlock Text="{Binding User.Username}" FontWeight="Bold" />

            <TextBlock Text="{Binding Timestamp, StringFormat=g}"
           FontSize="10" Foreground="Gray" VerticalAlignment="Center" Margin="5,0,0,0" />

        </StackPanel>

        <TextBlock Text="{Binding Text}"
                   VerticalAlignment="Top"
                   TextWrapping="Wrap"
        />
    </DockPanel>
</DataTemplate>
```

### Property Elements
Property elements can hold complex children types:
```xaml
<Button>
  <Button.Content>
    <Image Source="smiley.jpg" Height="50" Width="80"/>
  </Button.Content>
</Button>
```

## Structure of WPF Applications
### Hello World
```csharp
public class HelloWindow : Window {
  private Button btn;
  
  public HelloWindow() {
    btn = new Button() { Content = "Quit" };
    btn.Click += new RoutedEventHandler(OnClick);
    this.AddChild(btn);
    this.Title = "WPF Hello App";
    this.Width = 120;
    this.Height = 80;
  }
  
  void OnClick(object sender, RoutedEventArgs e) => this.Close();
  
  [STAThread]
  static void Main(string[] args) {
    Application app = new Application();
    app.Run(new HelloWindow());
  }
}
```

### `Application` and `Window` Classes
* class `Application`: manages the windows and the main loop of the application (`Application app = new Application();`)
* method `Run`: starts the main loop
* method `ShutDown`: ends the main loop
* property `MainWindow`: sets the main window of the application
* property `ShutdownMode`: `OnLastWindowClose`, `OnMainWindowClose` or `OnExplicitShutdown`
* event `Startup`: main loop has been started
* event `SessionEnding`: user logs out of window

### Hello World in XAML
Resource definitions for the global application:
```xaml
<Application
  xmlns=" http://schemas.microsoft.com/winfx/2006/xaml/presentation"
  StartupUri="HelloWindow.xaml"
/>
```

Window description:
```xaml
<Window
  xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
  xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
  x:Class="HelloWindow"
  Title="WPF Hello App"
  Width="120"
  Height="80"
>
  <Button Click="OnClick">Quit</Button>
</Window>
```

```csharp
public partial class HelloWorld : Window {
  private void OnClick(object sender, RoutedEventArgs e) {
    this.Close();
  }
}
```

## MainWindow.xaml.cs
```cs
public partial class MainWindow : Window
{
    private MainViewModel mainViewModel;
    public MainWindow()
    {
        InitializeComponent();

        var currentUser = new User()
        {
            Username = "user",
            ProfileUrl = "https://robohash.org/100.png?size=150x150"
        };

        mainViewModel = new MainViewModel(new SimulatedMessagingLogic(currentUser));
        DataContext = mainViewModel;

        Loaded += async (s, e) => await mainViewModel.InitializeAsync();
    }
}
```

## ViewModels
```cs
public class MainViewModel
{
    private IMessagingLogic messagingLogic;
    private ChannelViewModel currentChannel;

    public MainViewModel(IMessagingLogic messagingLogic)
    {
        this.messagingLogic = messagingLogic ?? throw new ArgumentNullException(nameof(messagingLogic));
        CreateChannelViewModel = new CreateChannelViewModel(this.messagingLogic);
    }

    public ObservableCollection<ChannelViewModel> Channels { get; private set; } = new ObservableCollection<ChannelViewModel>();

    public ChannelViewModel CurrentChannel
    {
        get => currentChannel;
        set
        {
            currentChannel = value;
            currentChannel.UnreadMessages = 0;
        }
    }

    public CreateChannelViewModel CreateChannelViewModel { get; }

    public async Task InitializeAsync()
    {
        var channels = await messagingLogic.GetChannelsAsync();
        foreach (var channel in channels)
        {
            Channels.Add(new ChannelViewModel(channel, messagingLogic)); // calls property changed event
        }

        messagingLogic.MessageReceived += OnMessageReceived;

        this.messagingLogic.ChannelCreated += OnChannelCreated;
    }

    private void OnMessageReceived(Message message)
    {
        var channel = Channels.First(c => c.Channel.Name == message.Channel.Name);
        channel.Messages.Add(message);

        if (channel != CurrentChannel)
        {
            channel.UnreadMessages++;
        }
    }

    private void OnChannelCreated(Channel channel)
    {
        this.Channels.Add(new ChannelViewModel(channel, this.messagingLogic));
    }
}
```

## WPF Base Classes
![WPF Base Classes](./images/wpf-base-classes.png)

### DispatcherObject
* all WPF classes are not thread safe
* the dispatcher which is associated with the `DispatcherObject` puts every method call into an event queue, which will be processed by the UI thread

### DependencyObject
* enables dependency properties
* dependency properties have additional characteristics: default value, inheritance in control element tree, event firing when value changes
* dependency properties are used for styling, databinding and animation

Use Cases for dependency properties:
* inheritance of property values
* styling of control elements
* listening for property value changes

### Attached Properties
* special dependeny properties for arbitrary objects
* typical use case: layout classes (`DockPanel.Dock`)

## WPF Controls
### `Button`
```xaml
<Button
  x:Name="submitButton"
  Grid.Column="1"
  Grid.Row="3"
  Grid.ColumnSpan="2"
  Margin="10"
  Click="submitButton_Click"
>
  Click Me
</Button>
```

### `CheckBox`

### `ComboBox`
* displays a dropdown list
```xaml
<ComboBox>
  <ComboBoxItem>ComboBox Item #1</ComboBoxItem>
  <ComboBoxItem IsSelected="True">ComboBox Item #2</ComboBoxItem>
  <ComboBoxItem>ComboBox Item #3</ComboBoxItem>
</ComboBox>
```

### `Image`
* display an image

### `TextBlock`
* renders simple text (strings only)
* often used as a label
```xaml
<TextBlock
  Grid.Column="1"
  Grid.Row="1"
  FontSize="36"
  Grid.ColumnSpan="3"
  Margin="0,0,0,20"
>
  Hello World
</TextBlock>
```

### `TextBox`
* lets the user input text
```xaml
<TextBox
  AcceptsReturn="True"
  TextWrapping="Wrap"
  SpellCheck.IsEnabled="True"
  Language="en-US"
  SelectionChanged="TextBox_SelectionChanged"
/>
```
```csharp
private void TextBox_SelectionChanged(object sender, RoutedEventArgs e)
{
  ...
}
```

## WPF Panels
### `DockPanel`
* docks child controls to the top, bottom, left or right

### `Grid`
```xaml
<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition Width="300"/>
        <ColumnDefinition Width="*"/>
    </Grid.ColumnDefinitions>

    <Grid Grid.Column="0">
        <Grid.RowDefinitions>
            <RowDefinition Height="*"/>
            <RowDefinition Height="auto"/>
        </Grid.RowDefinitions>
        ...
```

### `StackPanel`
* stacks up child controls next to each other without wrapping into the next line

### `UniformGrid`
* like the `Grid` but all rows and columns have the same size

### `WrapPanel`
* child control next to each other until there is no more space

## Events
```xaml
<Button Name="button1" Click="ButtonClick" Content="Button 1"/>
```
```csharp
private void ButtonClick(object sender, RoutedEventArgs e) { ... }
```

## Commands
* abstraction of user actions
```xaml
<Window.InputBindings>
  <KeyBinding Command="ApplicationCommands.Save" Key="S" Modifiers="Control"/>
</Window.InputBindings>
<MenuItem Header="_Save" Command="ApplicationCommands.Save"/>
<Button Content="Save" Command="ApplicationCommands.Save"/
<Window.CommandBindings>
  <CommandBinding Command="ApplicationCommands.Save" Executed="SaveExecuteHandler" CanExecute="SaveCanExecuteHandler"/>
</Window.CommandBindings>
```
```csharp
public void SaveExecutionHandler(object sender, ExecutedRoutedEventArgs e) { ... }
public void SaveCanExecuteHandler(object sender, CanExecuteRoutedEventArgs e) {
  e.CanExecute = ...;
}
```

## Data Binding
* between GUI elements:
```xaml
<StackPanel>
  <Slider Name="slider" Value="50" Minimum="0" Maximum="100" ... />
  <TextBox Name="textBox" Text="{Binding ElementName=slider, Path=Value, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" ... />
</StackPanel>
```

## `INotifyPropertyChanged`
* implementing classes notify subscribed clients in case of value changes on their properties
```csharp
public class Person : INotifyPropertyChanged {
  private string name;
  public event PropertyChangedEventHandler PropertyChanged;
  
  public string Name {
    get => name;
    set {
      if (name != value) {
        name = value;
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameOf(Name)));
      }
    }
  }
}
```

## MVVM
* ViewModel prepares data for View
* View and ViewModal only coupled through data binding
* ViewModel passes values changes through PropertyChange events
