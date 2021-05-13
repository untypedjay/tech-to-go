# React Native
## Core Components and APIs
### Overview
|React Native|Android View|iOS View|Web Analog|
|:--------|:--------|:-----------|:------------|
|`<View>`|`<ViewGroup>`|`<UIView>`|non scrolling `<div>`|
|`<Text>`|`<TextView>`|`<UITextView>`|`<p>`|
|`<Image>`|`<ImageView>`|`<UIImageView>`|`<img>`|
|`<ScrollView>`|`<ScrollView>`|`<UIScrollView>`|`<div>`|
|`<TextInput>`|`<EditText>`|`<UITextField>`|`<input type="text">`|

### Basic Components
* `View`:
* `Text`
* `Image`
* `TextInput`
* `ScrollView`: provides a scrolling container that can host multiple components and views
* `StyleSheet`: provides an abstraction layer similar to CSS stylesheets

### User Interface
* `Button`
* `Switch`: renders a boolean input

### List Views
* `FlatList`: only renders content that is currently shown on the screen (unlike the more generic `ScrollView`)
* `SectionList`: like `FlatList` with logical sections

### Android-specific
* `BackHandler`: detect hardware button presses for back navigation
* `DrawerLayoutAndroid`
* `PermissionsAndroid`
* `ToastAndroid`

### iOS-specific
* `ActionSheetIOS`

### Others
* `ActivityIndicator`: circular loading indicator
* `Alert`
* `Animated`: animation library
* `Dimensions`: getting device dimensions
* `KeyboardAvoidingView`: moves out of the virtual keyboard automatically
* `Linking`: incoming and outgoing app links
* `Modal`
* `PixelRatio`
* `RefreshControl`: adds pull to refresh functionality in `ScrollView`
* `StatusBar`
