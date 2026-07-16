class_name IdManager
extends Resource

var objects = {}

var nextId := 0

func getId(ref: Variant) -> int:
	var returnedId = nextId
	objects[returnedId] = ref
	
	nextId += 1
	return returnedId

func getObjectById(id: int) -> Variant:
	return objects[id]

func removeObjectById(id: int) -> void:
	objects.erase(id)
