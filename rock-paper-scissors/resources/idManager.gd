class_name IdManager
extends Resource

var nextId := 0

func getId() -> int:
	var returnedId = nextId
	nextId += 1
	return returnedId
