class TomatoGameInfo extends UTGame;

defaultproperties
{
	MapPrefixes(0)='TMT'
	DefaultPawnClass=class'Tomato.TomatoPawn'
	PlayerControllerClass=class'Tomato.TomatoPlayerController'
	BotClass=class'Tomato.TomatoBot'
	HUDType=class'Tomato.TomatoHUD'

	bUseClassicHUD=true

	DefaultInventory(0)=none
	DefaultInventory(1)=none
}