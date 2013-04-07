class TomatoPawn extends UDNPawn
	dependson(UDNPawn);

simulated function Tick(float DeltaTime)
{
	local vector tmpLocation;
	super.Tick(DeltaTime);

	tmpLocation = Location;
	tmpLocation.Y = 500;

	SetLocation(tmpLocation);
}

function bool Dodge(eDoubleClickDir DoubleClickMove)
{
	return false;
}

defaultproperties
{
	ControllerClass=class'Tomato.TomatoBot'
	bCanStrafe=false
	MaxStepHeight=50.0
	MaxJumpHeight=96
	JumpZ=550
}