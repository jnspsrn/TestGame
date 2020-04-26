extends Node2D

var resistorValue
var firstDigit = 9
var secondDigit = 9
var multiplierDigit = 0
var firstDigitColors = {
	0 : Color.black,
	1 : Color.brown,
	2 : Color.red,
	3 : Color.orange,
	4 : Color.yellow,
	5 : Color.green,
	6 : Color.blue,
	7 : Color.purple,
	8 : Color.gray,
	9 : Color.white,
}
var secondDigitColors = firstDigitColors
var multiplierColors = {
	0 : Color.black,
	1 : Color.brown,
	2 : Color.red,
	3 : Color.orange,
	4 : Color.yellow,
	5 : Color.green,
	6 : Color.blue,
	7 : Color.purple,
	8 : Color.gold,
	9 : Color.silver
}
var multiplierValues = {
	0 : 1,
	1 : 10,
	2 : 100,
	3 : 1000,
	4 : 10000,
	5 : 100000,
	6 : 1000000,
	7 : 10000000,
	8 : 0.1,
	9 : 0.01
}

onready var indicatorOne = $IndicatorOne
onready var indicatorTwo = $IndicatorTwo
onready var indicatorThree = $IndicatorThree
onready var valueIndicator = $ValueIndicator

func _ready():
	indicatorOne.modulate = firstDigitColors.get(firstDigit)
	indicatorTwo.modulate = secondDigitColors.get(secondDigit)
	indicatorThree.modulate = multiplierColors.get(multiplierDigit)

func _physics_process(delta):
	calculate_resistor_value()

func _on_UpOne_pressed():
	if firstDigit != 0:
		firstDigit = firstDigit - 1
	elif firstDigit == 0:
		firstDigit = 9
	indicatorOne.modulate = firstDigitColors.get(firstDigit)

func _on_DownOne_pressed():
	if firstDigit != 9:
		firstDigit = firstDigit + 1
	elif firstDigit == 9:
		firstDigit = 0
	indicatorOne.modulate = firstDigitColors.get(firstDigit)

func _on_UpTwo_pressed():
	if secondDigit != 0:
		secondDigit = secondDigit - 1
	elif secondDigit == 0:
		secondDigit = 9
	indicatorTwo.modulate = secondDigitColors.get(secondDigit)

func _on_DownTwo_pressed():
	if secondDigit != 9:
		secondDigit = secondDigit + 1
	elif secondDigit == 9:
		secondDigit = 0
	indicatorTwo.modulate = secondDigitColors.get(secondDigit)

func _on_UpThree_pressed():
	if multiplierDigit != 0:
		multiplierDigit = multiplierDigit - 1
	elif multiplierDigit == 0:
		multiplierDigit = 9
	indicatorThree.modulate = multiplierColors.get(multiplierDigit)

func _on_DownThree_pressed():
	if multiplierDigit != 9:
		multiplierDigit = multiplierDigit + 1
	elif multiplierDigit == 9:
		multiplierDigit = 0
	indicatorThree.modulate = multiplierColors.get(multiplierDigit)

func calculate_resistor_value():
	var digitvalue = int(str(firstDigit) + str(secondDigit))
	var multiplier = multiplierValues.get(multiplierDigit)
	resistorValue = digitvalue * multiplier
	update_value_indicator()

func update_value_indicator():
	valueIndicator.text = str(resistorValue)
