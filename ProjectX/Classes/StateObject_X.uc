/*******************************************************************************
 * StateObject_X generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class StateObject_X extends Object
    abstract
    native;

var() bool bDebug;

// Export UStateObject_X::execDestroy(FFrame&, void* const)
native function Destroy();

event Destroyed()
{
    //return;    
}

// Export UStateObject_X::execInitExecution(FFrame&, void* const)
native function InitExecution();