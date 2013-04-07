class SeqAct_TMTSetCoinsNeeded extends SequenceAction;

var() int NumCoins;

defaultproperties
{
	ObjName="Set Coins Needed"
		ObjCategory="Tomato"
	HandleName="SetCoinsNeeded"

	NumCoins=0
	VariableLinks(1)=(ExpectedType=class'SeqVar_Int', LinkDesc="NumCoins", bWriteable=true, PropertyName=NumCoins)
}