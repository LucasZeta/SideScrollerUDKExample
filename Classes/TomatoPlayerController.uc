class TomatoPlayerController extends UDNPlayerController
	dependson(UDNPlayerController)
	dependson(SeqAct_TMTCollectCoin)
	dependson(SeqAct_TMTGivePoints)
	dependson(SeqAct_TMTSetCoinsNeeded);

var() int Points;
var() int CoinsCollected;
var() int CoinsNeededInThisLevel;

function CollectCoin(SeqAct_TMTCollectCoin Action)
{
	CoinsCollected++;
	TestWinningConditions();
}

function AddPoints(SeqAct_TMTGivePoints Action)
{
	Points += Action.NumPoints;
}

function SetCoinsNeeded(SeqAct_TMTSetCoinsNeeded Action)
{
	CoinsNeededInThisLevel = Action.NumCoins;
}

exec function TestWinningConditions()
{
	`log("TestWinningConditions() : Checking winning conditions");
	`log("TestWinningConditions() : Collected: " $ CoinsCollected);
	`log("TestWinningConditions() : Needed: " $ CoinsNeededInThisLevel);

	if ( (CoinsCollected > 0) && (CoinsNeededInThisLevel > 0) && (CoinsCollected >= CoinsNeededInThisLevel) )
	{
		`log("TestWinningConditions() : Victory!");
	}
	else
	{
		`log("TestWinningConditions() : Go collect more coins!");
	}
}

defaultproperties
{
	Points=0
	CoinsCollected=0
	CoinsNeededInThisLevel=1
}