/*******************************************************************************
* SeqAct_GetWeatherEnabled_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SeqAct_GetWeatherEnabled_TA extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var private bool bEnabled;

defaultproperties
{
    bCallHandler=false
    bAutoActivateOutputLinks=false
    OutputLinks(0)=(Links=none,LinkDesc="Enabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Disabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=none,LinkDesc="Enabled",LinkVar=None,PropertyName=bEnabled,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Get Weather Enabled"
	ObjCategory="TAGame_decrypted"
}
event Activated()
{  /*Function decompiling is disabled */ }
