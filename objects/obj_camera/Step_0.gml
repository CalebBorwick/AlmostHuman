//update camera

//update destination
if (instance_exists(follow)){
	xTo =follow.x;
	yTo = follow.y;
}

//update obj position
x+=(xTo -x) /10;
y+=(yTo - y) /10;

//keep camera in room
x = floor(clamp(x, viewWidthHalf, room_width - viewWidthHalf));
y = floor(clamp(y, viewHeightHalf, room_height - viewHeightHalf));

//screen shake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam,x-viewWidthHalf, y-viewHeightHalf);