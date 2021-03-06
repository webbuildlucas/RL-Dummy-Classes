/*******************************************************************************
* AkRTPCDecayComponent generated by MVN.RLLib using UE Explorer.
* MVN.RLLib © 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class AkRTPCDecayComponent extends ActorComponent
    editinlinenew
    hidecategories(Object);

var() private name RTPC;
var() private float GrowValue;
var() private float MaxValue;
var() private InterpCurveFloat DecayPerSecond;
var private const export editinline transient AkSoundSource SoundSource;
var private const transient float CurrentValue;
var private const transient float LastAttachTime;
var private const transient bool bWasAttached;

defaultproperties
{
    GrowValue=1.0
    MaxValue=1.0
}