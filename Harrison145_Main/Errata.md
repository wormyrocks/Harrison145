# Rev1 Assembly Notes
* R56 (20K, line item 30) didn't get ordered from Mouser, it was combined with one of the other line items by mistake
* There were two bags matching line item 11, one of them ended up unused.

# Rev1 Test Notes
## Board 1 (Test board, variable resistor leads untrimmed)
* On first power on, board pulls about 315 mA at 9V, too much
* 7v5 rail shows 5v7. Either the regulator is configured wrong or something downstream is hitting its current limit
## Board 2 (Golden sample board, variable resistor leads trimmed)
* Board pulls about 110 mA at 9V
* 7.5V rail drops to 0.5V - seems like entire board voltage is dropping across LDO, or there's a downstream short
* Indeed - 5.9 ohms on the 7.5V rail


# Rev1 Board Errata
## Schematic
* TP8 should be attached to 7v5; isn't
## PCB
* C32, C40 use a capacitor rated for only 2.5V
* Recommend replacing with: https://www.mouser.com/ProductDetail/United-Chemi-Con/EMZR160ARA221MF61G
