package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('singUP-special', 'boyfriend dodge', 24, false);
				animation.addByPrefix('singUPmiss-special', 'BF hit', 15, false);
				animation.addByPrefix('singLEFT-special', 'BF HEY', 24, false);
				animation.addByPrefix('singLEFTmiss-special', 'BF NOTE LEFT MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				animation.addByPrefix('singUP-alt', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT-alt', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN-alt', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss-alt', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss-alt', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss-alt', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss-alt', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("singUP-alt", -29, 27);
				addOffset("singRIGHT-alt", -38, -7);
				addOffset("singLEFT-alt", 12, -6);
				addOffset("singDOWN-alt", -10, -50);
				addOffset("singUPmiss-alt", -29, 27);
				addOffset("singRIGHTmiss-alt", -30, 21);
				addOffset("singLEFTmiss-alt", 12, 24);
				addOffset("singDOWNmiss-alt", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset("singUP-special", 0, 0);
				addOffset("singUPmiss-special", 0, 27);

				playAnim('idle');

				flipX = true;

			case 'rosie':
				tex = Paths.getSparrowAtlas('blossom/rosie_assets');
				frames = tex;
				animation.addByPrefix('idle', 'rosanna idle', 24, false);
				animation.addByPrefix('singUP', 'rosanna up', 24, false);
				animation.addByPrefix('singRIGHT', 'rosanna right', 24, false);
				animation.addByPrefix('singDOWN', 'rosanna down', 24, false);
				animation.addByPrefix('singLEFT', 'rosanna left', 24, false);
				animation.addByPrefix('ara', 'rosanna ara ara', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 97, 127);
				addOffset("singRIGHT", -93, -123);
				addOffset("singLEFT", 15, 27);
				addOffset("singDOWN", -29, -126);
				addOffset("ara", -19, 0);
			
				playAnim('idle');
					
			case 'rosie-angry':

				tex = Paths.getSparrowAtlas('blossom/rosie_assets 2');
				frames = tex;
					
				animation.addByPrefix('idle', "angry rosanna idle", 24, false);
				animation.addByPrefix('singUP', "angry rosanna up", 24, false);
				animation.addByPrefix('singDOWN', "angry rosanna down", 24, false);
				animation.addByPrefix('singLEFT', "angry rosanna left", 24, false);
				animation.addByPrefix('singRIGHT', "angry rosanna right", 24, false);
				animation.addByPrefix('fuck this', "rosanna lost it", 24, false);
					
				addOffset('idle');
				addOffset('singUP', 97, 127);
				addOffset('singRIGHT', -93, -123);
				addOffset('singLEFT', 15, 27);
				addOffset('singDOWN', -29, -126);
				addOffset('fuck this', 1295, 87);
	
				playAnim('idle');
				
			
			case 'rosie-furious':
				tex = Paths.getSparrowAtlas('blossom/rosie_assets 3');
				frames = tex;

				animation.addByPrefix('idle', 'furious rosanna idle', 24, false);
				animation.addByPrefix('singUP', 'furious rosanna up', 24, false);
				animation.addByPrefix('singRIGHT', 'furious rosanna right', 24, false);
				animation.addByPrefix('singDOWN', 'furious rosanna down', 24, false);
				animation.addByPrefix('singLEFT', 'furious rosanna left', 24, false);
				animation.addByPrefix('singUP-alt', 'furious rosanna up', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'furious rosanna right', 24, false);
				animation.addByPrefix('singDOWN-alt', 'furious rosanna down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'furious rosanna left', 24, false);
				animation.addByPrefix('singUP-special', 'furious rosanna shoot', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 97, 26);
				addOffset("singRIGHT", 54, 1);
				addOffset("singLEFT", 158, 45);
				addOffset("singDOWN", 229, -126);
				addOffset("singUP-alt", 97, 26);
				addOffset("singRIGHT-alt", 54, 1);
				addOffset("singLEFT-alt", 158, 45);
				addOffset("singDOWN-alt", 229, -126);
				addOffset("singUP-special", -29, -126);

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName) == true)
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
