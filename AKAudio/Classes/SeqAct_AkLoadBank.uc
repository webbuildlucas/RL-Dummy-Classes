/*******************************************************************************
* SeqAct_AkLoadBank generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SeqAct_AkLoadBank extends SeqAct_Latent
    forcescriptorder(true)
    hidecategories(Object);

var() private bool Async;
var private transient bool bWaitingCallback;
var() private AkBank Bank;
var private transient int Signal;

defaultproperties
{
    Async=true
    InputLinks(0)=(LinkDesc="Load",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Unload",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks(0)=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0,bIsActivated=false)
    VariableLinks=none
    ObjName="AkLoadBank"
	ObjCategory="AkAudio"
}