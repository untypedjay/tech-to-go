# Visibility
## Visibility Attributes
|Name|Access Domain|
|:---|:---|
|public|everywhere|
|protected|own class, derived classes|
|internal|own assembly|
|protected interal|own assembly, derived classes|
|private protected|own class, derived classes in own assembly|
|private|own class only|

## Default Values
|Name|Visibility Attribute|
|:---|:---|
|methods / arrays|private|
|outer type definitions|internal|
|inner type definitions|private|
|interface methods|public|
|enumeration constants|public|
