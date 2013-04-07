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