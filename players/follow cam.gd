extends Camera2D

@export var tilemap : TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tilesize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tilesize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y
