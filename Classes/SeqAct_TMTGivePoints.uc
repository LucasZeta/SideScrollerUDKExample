class SeqAct_TMTGivePoints extends SequenceAction;

var() int NumPoints;

defaultproperties
{
	ObjName="Add Points"
		ObjCategory="Tomato"
	HandleName="AddPoints"

	NumPoints=0
	VariableLinks(1)=(ExpectedType=class'SeqVar_Int', LinkDesc="NumPoints", bWriteable=true, PropertyName=NumPoints)
}