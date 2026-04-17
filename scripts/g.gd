extends Node

var cells = []
var pieces = []
var dragging = false # global dragging, to avoid dragging multiple pieces
signal puzzle_solved 

const images = [
	"res://scenes/new scens/PuzzlePictures/Valley3.jpg",
	"res://scenes/new scens/PuzzlePictures/Valley2.jpg",
	"res://scenes/new scens/PuzzlePictures/Valley3.jpg"
]

enum DIFFICULTY {
	EASY,
	MEDIUM,
	HARD
}

const DIFFICULTY_VALUES = {
	DIFFICULTY.EASY: 3,
	DIFFICULTY.MEDIUM: 4,
	DIFFICULTY.HARD: 5
}

var chosen_difficulty = DIFFICULTY.EASY
var grid_size = Vector2i(
	DIFFICULTY_VALUES[chosen_difficulty],
	DIFFICULTY_VALUES[chosen_difficulty]
)

func get_image():
	var image = Image.load_from_file(images.pick_random())
	return image
	
func find_cell(index: int):
	for cell in cells:
		if cell.index == index:
			return cell
			
func check_win():
	for piece in pieces:
		if piece.index != piece.cell_index:
			return
	print("YOU WON!")
	emit_signal("puzzle_solved")
	return true
