/*******************************************************************************
* VehiclePickup_Boost_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class VehiclePickup_Boost_TA extends VehiclePickup_TA
    placeable
    hidecategories(Navigation);

enum EBoostType
{
    BoostType_Unknown,
    BoostType_Pill,
    BoostType_Pad,
    BoostType_MAX
};

//Texture to display in the editor when this point is being used as a spawn point
var transient editoronly Texture2D SpawnSpriteTexture;

var() private float BoostAmount;
var() private AkSoundCue LocalPickupSound;
var() private VehiclePickup_Boost_TA.EBoostType BoostType;

defaultproperties
{
	SpawnSpriteTexture=Texture2D'EditorMaterials.TargetIconSpawn'

	Begin Object Name=Sprite
		Sprite=Texture2D'EditorRL.Textures.BoostIcon'
		Scale=0.35
		HiddenGame=true
		AlwaysLoadOnClient=false
		AlwaysLoadOnServer=false
		SpriteCategoryName="BoostIcon"
	End Object
}

protected function bool CanPickup(Car_TA Car){}

singular function Pickup(Car_TA Car){}

protected simulated function PlayPickedUpFX(){}