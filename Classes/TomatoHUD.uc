class TomatoHUD extends UTHUD;

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

    Canvas.SetPos(BarPositionX + MaxBarWidth + 10, BarPositionY);
    Canvas.SetDrawColor(0, 200, 0, 200);
    Canvas.Font = class'Engine'.static.GetMediumFont();
    Canvas.DrawText("Health: " $ HealthPercentage);
}