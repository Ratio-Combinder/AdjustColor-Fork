package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flxanimate.motion.AdjustColor;

class PlayState extends FlxState
{
	var adjust = new AdjustColor();

	override public function create()
	{
		adjust.brightness = 0;
		adjust.contrast = 0;
		adjust.saturation = 0;
		adjust.hue = 0;

		var background = FlxGridOverlay.create(10, 10);
		add(background);
		var bf = new FlxSprite(AssetPaths.bf__png);
		bf.screenCenter();
		bf.antialiasing = true;
		var shader = new AdjustShader();
		shader.matrix = adjust.calculateFinalFlatArray();
		bf.shader = shader.shader;
		add(bf);
		var filteredbf = new FlxSprite(bf.x + bf.width, bf.y, AssetPaths.filtered_bf__png);
		filteredbf.antialiasing = true;
		add(filteredbf);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.Pressed.W)
			adjust.brightness -= elapsed * 0.1;
		if (FlxG.keys.Pressed.S)
			adjust.brightness += elapsed * 0.1;
		if (FlxG.keys.Pressed.R)
			adjust.contrast -= elapsed * 0.1;
		if (FlxG.keys.Pressed.F)
			adjust.contrast += elapsed * 0.1;
		if (FlxG.keys.Pressed.Y)
			adjust.saturation -= elapsed * 0.1;
		if (FlxG.keys.Pressed.H)
			adjust.saturation += elapsed * 0.1;
		if (FlxG.keys.Pressed.I)
			adjust.hue -= elapsed * 0.1;
		if (FlxG.keys.Pressed.K)
			adjust.hue += elapsed * 0.1;
		
		super.update(elapsed);
	}
}
