
function screen_shake(magnitude, frames){
	with (global.iCamera){
		if (magnitude > shakeRemain){
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}