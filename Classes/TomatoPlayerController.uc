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
}

function AddPoints(SeqAct_TMTGivePoints Action)
{
	Points += Action.NumPoints;
}

function SetCoinsNeeded(SeqAct_TMTSetCoinsNeeded Action)
{
	CoinsNeededInThisLevel = Action.NumCoins;
}

defaultproperties
{
	Points=0
	CoinsCollected=0
	CoinsNeededInThisLevel=1
}