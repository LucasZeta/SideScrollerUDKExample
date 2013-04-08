class TomatoHUD extends UTHUD;

function DrawString(string Text, int PositionX, int PositionY, int ColorR, int ColorG, int ColorB, int ColorA)
{
	Canvas.SetPos(PositionX, PositionY);
	Canvas.SetDrawColor(ColorR, ColorG, ColorB, ColorA);

	Canvas.Font = class'Engine'.static.GetMediumFont();
	Canvas.DrawText(Text);
}

function DrawHealthBar(float Health)
{
	local int CurrentBarWidth;
	local int MaxBarWidth;
	local int BarHeight;
	local int BarPositionX;
	local int BarPositionY;
	local int HealthPercentage;

	MaxBarWidth = 300;
	BarHeight = 20;
	BarPositionX = 20;
	BarPositionY = 20;
	HealthPercentage = Health * 100;
	CurrentBarWidth  = Health;

	// Filled part of the health bar.
	Canvas.SetPos(BarPositionX, BarPositionY);
	Canvas.SetDrawColor(80, 200, 80, 200);
	Canvas.DrawRect(CurrentBarWidth, BarHeight);

	// Empty part of the health bar.
	Canvas.SetPos(BarPositionX + CurrentBarWidth, BarPositionY);
	Canvas.SetDrawColor(200, 255, 200, 110);
	Canvas.DrawRect(MaxBarWidth - CurrentBarWidth, BarHeight);

	DrawString(
		"Health: " $ HealthPercentage,
		BarPositionX + MaxBarWidth + 10, BarPositionY,
		0, 200, 0, 200
	);
}

function DrawGameHud()
{
	local TomatoPlayerController ThisPlayerController;

	ThisPlayerController = TomatoPlayerController(PlayerOwner);

	if (!PlayerOwner.IsDead())
	{
		if (PlayerOwner.Pawn.HealthMax > 0)
		{
			DrawHealthBar(float(PlayerOwner.Pawn.Health) / float(PlayerOwner.Pawn.HealthMax));
		}

		DrawString("Coins: " $ ThisPlayerController.CoinsCollected $ "/" $ ThisPlayerController.CoinsNeededInThisLevel, 20, 40, 140, 80, 0, 200);
		DrawString("Score: " $ ThisPlayerController.Points, 20, 60, 0, 80, 160, 200);
	}
}
