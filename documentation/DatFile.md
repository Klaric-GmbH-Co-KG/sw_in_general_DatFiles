# DatFile 

## Definition

Beschreibung eines GUI-Layouts in der Toolbox

---

## Aufbau

Der Aufbau besteht aus 3x Abschnitten:

### 1. Festlegung von Parametergruppen (Reiter)
```C
[GLOBAL]
Group_01            = "Tk:GlobalPar"
User_01             = default
Ident_01            = "GLOBAL_PAR"
Display_01          = "ViewAndModify"

Group_02            = "Tk:Ethernet"
Enable_02           = SW_EN_ETH
User_02             = default
Ident_02            = "ETHERNET_PAR"
Display_02          = "ViewAndModify"
SubGroup_1          = "TK:CommonPar"
SubGroup_2          = "PTP"
SubGroup_3          = "PLP"

Group_03            = "Tk:ChannelPar"
SubGroup_1          = "P1/P1B"
SubGroup_2          = "P2/P2B"
SubGroup_3          = "P3/P3B"
SubGroup_4          = "P4/P4B"
SubGroup_5          = "P5/P5B"
SubGroup_6          = "P6/P6B"
SubGroup_7          = "P7/P7B"
SubGroup_8          = "P8/P8B"
User_03             = default
Ident_03            = "CHANNEL_PAR"
Display_03          = "ViewAndModify"

Group_04            = "Tk:Probe3rdParty"
SubGroup_1          = "P1/P1B"
SubGroup_2          = "P2/P2B"
SubGroup_3          = "P3/P3B"
SubGroup_4          = "P4/P4B"
SubGroup_5          = "P5/P5B"
SubGroup_6          = "P6/P6B"
SubGroup_7          = "P7/P7B"
SubGroup_8          = "P8/P8B"
User_04             = default; access
Ident_04            = "PROBE3RD_PAR"
Display_04          = "ViewAndModify"

Group_05            = "Tk:FastPar"
SubGroup_1          = "Tk:FastSpeed"
SubGroup_2          = "P1"
SubGroup_3          = "P2"
SubGroup_4          = "P3"
SubGroup_5          = "P4"
SubGroup_6          = "P1B"
SubGroup_7          = "P2B"
SubGroup_8          = "P3B"
SubGroup_9          = "P4B"
User_05             = Operator
Ident_05            = "FAST_PAR"
Display_05          = "ViewAndModify"

Group_06            = "CAN"; global parameter
SubGroup_1          = "general"
SubGroup_2          = "P1/P1B"
SubGroup_3          = "P2/P2B"
SubGroup_4          = "P3/P3B"
SubGroup_5          = "P4/P4B"
SubGroup_6          = "P5/P5B"
SubGroup_7          = "P6/P6B"
SubGroup_8          = "P7/P7B"
SubGroup_9          = "P8/P8B"
User_06             = default; access
Ident_06            = "CANID_DATA"
Display_06          = "ViewAndModify"

Group_07            = "Activation"
User_07             = default; access
Ident_07            = "ACT_KEY_PAR"
Display_07          = "ViewAndModify"
Save_07             = "No"

Group_08            = "Tk:ProbeStat"; global parameter
SubGroup_1          = "P1/P1B"
SubGroup_2          = "P2/P2B"
SubGroup_3          = "P3/P3B"
SubGroup_4          = "P4/P4B"
SubGroup_5          = "P5/P5B"
SubGroup_6          = "P6/P6B"
SubGroup_7          = "P7/P7B"
SubGroup_8          = "P8/P8B"
User_08             = default; access
Ident_08            = "PROBE_DATA"
Display_08          = "ViewOnly"
Save_08             = "No"
```
Nachteil: 
- Fortlaufende Nummerierung von Gruppen erfoderlich: 
```C
Group_01            = "Tk:GlobalPar"
...
Group_02            = "Tk:Ethernet"
...
Group_03            = "Tk:ChannelPar"
...
Group_04            = "Tk:Probe3rdParty"
...
Group_05            = "Tk:FastPar"
...
Group_06            = "CAN"    
```
- Nicht zulässig: fehlende Nummer dazwischen
```C
Group_01            = "Tk:GlobalPar"
...
Group_03            = "Tk:ChannelPar"
...
```
- (Später) Das Referenzieren von Benutzervariablen auf die Gruppe erfolgt über die Nummerierung. 
```C
[CAN_BaseId]
Enable              = SW_EN_CAN2
Group               = 1
Common              = "CAN_BaseId"
Default             = 0x700
Help                = "CAN_BaseId_Fuse3"
Column              = 1
Row                 = 1
```

### 2. Festlegung von Modulbefehlen (Buttons)
```C
[COMMAND]
Name_01             = "Tk:Reset"
Value_01            = 0x0010
Id_01               = CMD_RESET
User_01             = default
Help_01             = "Reset"

Name_02             = "Apply Changes"
Value_02            = 0x0060
Id_02               = CMD_APPLY_CHANGES
User_02             = operator
Help_02             = "ApplyChanges"

Name_03             = "Tk:SaveAllPar"
Value_03            = 0x0020
Id_03               = CMD_SAVE_ALL_PAR
User_03             = operator
Help_03             = "SavePar"
```
Nachteil: 
- Auch fortlaufende Nummerierung erfoderlich! 

### 3. Deklaration und Darstellung von Benutzervariablen
Benutzervariable beschreibt eine Zielreferenz für empfangene Werte vom Messmodul.
Die Variable kann innerhalb der Toolbox unterschiedlich dargestellt werden:
- CheckBox group
- Radiobutton group
- String
- Nummer
```C
[CAN_BaseId]
Enable              = SW_EN_CAN2
Group               = 1
Common              = "CAN_BaseId"
Default             = 0x700
Help                = "CAN_BaseId_Fuse3"
Column              = 1
Row                 = 1

[CAN2_Baudrate]
Enable              = SW_EN_CAN2
Group               = 1
Common              = "CAN_Baudrate"
Name                = "CAN_Baudrate"
Type                = uInt
Column              = +0
Row                 = +1

[CAN2_OPTION]
Enable              = SW_EN_CAN2
Group               = 1
Common              = "CAN_Option"
Name                = "CAN_Option"
Type                = uInt
Help                = "Can_Option_Fuse3"
Column              = +0
Row                 = +1

[Common_Option]
Group               = 1
Column              = 2
Row                 = 1
Name                = "Tk:Common_Option"
Help                = "Common_Option"
Type                = uLong
Attrib              = Option
Option_01           = "Tk:Common:Channel:Option:Enable"
Mask_01             = 0x00000001
Option_02           = "Tk:Channel:Option:Autorange"
Mask_02             = 0x00000002

[Common_Speed]
Group               = 1
Common              = "SpeedAS8510"
Type                = uInt
Name                = "Tk:Common_Speed"
Help                = "Speed_8.192Mhz"
Default             = 0
Column              = +0
Row                 = +1

[Common_Range]
Group               = 1
Common              = "RangeAS8510"
Type                = uInt
Name                = "Tk:Common_Range"
Default             = 0
Column              = +0
Row                 = +1 
```
Wichtig:
- Datentyp muss identisch sein wie im Controller (KoDat)
- Reihenfolge beachten (nach KoDat) 
- Gleiche Anzahl (nicht mehr & nicht weniger):
    Wert_1 => Benutzervariable_1 
    Wert_2 => Benutzervariable_2
    ...
    Wert_N => Benutzervariable_N


## Umsetzung einer MULTI_Master.dat
Eine MULTI_Master.dat beinhaltet sämtliche Benutzervariablen von der MULTI-Familie.
Mittels Auslesen der Signatur bzw. der SW_ENABLES werden zulässige Benutzervariablen aktiviert. Anschließend wird ein virtuelles DatFile erzeugt.

### Anforderung
- Aktivierungsbedingung mit Logikoperatoren (&, | , !) einführen
```C
[P1_Option]
Enable              = !SW_EN_CB
Group               = 3
SubGroup            = 1
Common              = "Channel_Option_MULTI8"
Name                = "Tk:P1_Option"
RefC_Group          = "GLOBAL_PAR"
RefC_Parameter      = "Common_Option"
RefC_Mask           = 1
RefC_ResultMatch    = "ViewOnly"
RefC_ResultNoMatch  = "ViewAndModify"
Column              = +0
Row                 = +1

[P1_Option]
Enable              = SW_EN_CB & !SW_EN_AC
Group               = 3
SubGroup            = 1
Common              = "Channel_Option_MULTI_LV_All"
Name                = "Tk:P1_Option"
RefC_Group          = "GLOBAL_PAR"
RefC_Parameter      = "Common_Option"
RefC_Mask           = 1
RefC_ResultMatch    = "ViewOnly"
RefC_ResultNoMatch  = "ViewAndModify"
Column              = +0
Row                 = +1

[P1_Option]
Enable              = SW_EN_AC
Group               = 3
SubGroup            = 1
Common              = "Channel_Option_AC"
Name                = "Tk:P1_Option"
RefC_Group          = "GLOBAL_PAR"
RefC_Parameter      = "Common_Option"
RefC_Mask           = 1
RefC_ResultMatch    = "ViewOnly"
RefC_ResultNoMatch  = "ViewAndModify"
Column              = +0
Row                 = +1

```

- Neuzählung oder bessere Gruppenzuweisung nutzen, wenn ein Element (Variable, Gruppe oder Button) entfernt wird.

## Problem (Verwendung einer Master.dat)
- Schwer den Fehler zu finden, da das DatFile noch größer ist => Nadel im Heuhaufen

##Protobuf

Protobuf steht für Protocol Buffer und ist ein von Google entwickeltes Format zur Serialisierung von Daten. Es speichert strukturierte Daten effizient und kompakt in binärer Form und ermöglicht so eine schnellere Übertragung.

Protobuf ist eine leistungsstarke Methode zur Erstellung strukturierter Daten. Es unterstützt viele Datentypen, darunter Strings, Integer, Floats, Booleans, Enum, Maps(assoziative Arrays) ...

Es bietet mehrere Vorteile gegenüber anderen Formaten wie XML oder JSON:
Da die strukturierten Daten im Binärformat gespeichert werden, sind sie viel kleiner als textbasierte Formate wie XML oder JSON, wodurch sie schneller über Netzwerke übertragen werden können. 

