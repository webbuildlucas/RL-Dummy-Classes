/*******************************************************************************
* DynamicMeshActor_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib © 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class DynamicMeshActor_TA extends Actor
    placeable
    hidecategories(Navigation);

var() private const editconst export editinline StaticMeshComponent StaticMeshComponent;

defaultproperties
{
    Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bUsePrecomputedShadows=true
    End Object
    StaticMeshComponent=StaticMeshComponent0
    Components(0)=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
    bNoDelete=true
    bTickIsDisabled=true
    bWorldGeometry=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bDedicatedServerRelevant=false
}
simulated event PostBeginPlay()
{  /*Function decompiling is disabled */ }

simulated event Destroyed()
{  /*Function decompiling is disabled */ }

simulated event DestroyForMapUnload()
{  /*Function decompiling is disabled */ }

final simulated function ToggleBallPosition(bool bAdd)
{  /*Function decompiling is disabled */ }