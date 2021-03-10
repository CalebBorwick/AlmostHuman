// drop frag/items
if(entity_fragment_count >0){
	if(array_length_1d(entity_fragment)> 1){
		
		fragmentArray = array_create(entity_fragment_count, entity_fragment[0]);
		drop_items(x,y,fragmentArray);
		
		array = array_create(1,entity_fragment[1]);
		drop_singular_item(x,y,array);
	}
	else{
		fragmentArray = array_create(entity_fragment_count, entity_fragment[0]);
		drop_items(x,y,fragmentArray);
	}
}