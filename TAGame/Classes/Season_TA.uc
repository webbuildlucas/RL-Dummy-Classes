/*******************************************************************************
 * Season_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Season_TA extends Object;

/** # of teams participating */
var databinding int NumTeams;
/** 1v1, 2v2, etc */
var databinding int TeamSize;
/** AI difficulty (0, 1, 2) */
var databinding int Difficulty;
/** # of games in the regular season */
var databinding int NumRegularWeeks;
/** # of games in the playoffs */
var databinding int NumPlayoffsWeeks;
/** # of teams that make it to the playoffs */
var databinding int NumPlayoffsTeams;
/** Info on teams participating in this season */
var databinding array<SeasonTeam> Teams;
/** Info on players participating in this season */
var databinding array<SeasonPlayer> Players;
/** Player Stats for Season */
var databinding array<SeasonPlayerStat> PlayerStats;
/** Which year this season is */
var databinding int Year;
/** How many weeks into the season we are. This will exceed NumRegularWeeks as we enter the playoffs. */
var databinding int CurrentWeek;
var array<SeasonMatch> Matches;

/**
var delegate<EventWeekSimulated> __EventWeekSimulated__Delegate;

delegate EventWeekSimulated(Season_TA InSeason)
{
    //return;    
}


function BuildMatches()
{
    local SeasonMatch Match;
    local int TeamIdx, MatchesPerWeek, WeekIdx, MatchIdx, HomeIdx, AwayIdx,
	    SwapTeam, TeamsRemaining;

    local array<int> AllTeams;
    local bool bHomeTeam;

    TeamIdx = 0;
    J0x0B:
    // End:0x47 [Loop If]
    if(TeamIdx < Teams.Length)
    {
        AllTeams.AddItem(TeamIdx);
        ++ TeamIdx;
        // [Loop Continue]
        goto J0x0B;
    }
    MatchesPerWeek = Teams.Length / 2;
    WeekIdx = 0;
    J0x6A:
    // End:0x29F [Loop If]
    if(WeekIdx < NumRegularWeeks)
    {
        TeamIdx = 0;
        J0x8C:
        // End:0x29C [Loop If]
        if(TeamIdx < (AllTeams.Length - 1))
        {
            HomeIdx = 0;
            AwayIdx = AllTeams.Length - 1;
            MatchIdx = 0;
            J0xD4:
            // End:0x21B [Loop If]
            if(MatchIdx < MatchesPerWeek)
            {
                // End:0x15B
                if(bHomeTeam)
                {
                    Match.Team0 = AllTeams[HomeIdx];
                    Match.Team1 = AllTeams[AwayIdx];
                }
                // End:0x1BB
                else
                {
                    Match.Team0 = AllTeams[AwayIdx];
                    Match.Team1 = AllTeams[HomeIdx];
                }
                Match.Week = WeekIdx;
                Matches.AddItem(Match);
                ++ HomeIdx;
                -- AwayIdx;
                ++ MatchIdx;
                // [Loop Continue]
                goto J0xD4;
            }
            SwapTeam = AllTeams[AllTeams.Length - 1];
            AllTeams.Remove(AllTeams.Length - 1, 1);
            AllTeams.InsertItem(1, SwapTeam);
            ++ WeekIdx;
            bHomeTeam = !bHomeTeam;
            ++ TeamIdx;
            // [Loop Continue]
            goto J0x8C;
        }
        // [Loop Continue]
        goto J0x6A;
    }
    NumPlayoffsWeeks = NumPlayoffsTeams / 2;
    TeamsRemaining = NumPlayoffsTeams;
    Match.Team0 = -1;
    Match.Team1 = -1;
    WeekIdx = 0;
    J0x318:
    // End:0x40E [Loop If]
    if(WeekIdx < NumPlayoffsWeeks)
    {
        Match.Week = NumRegularWeeks + WeekIdx;
        MatchesPerWeek = TeamsRemaining / 2;
        // End:0x3A6
        if((MatchesPerWeek > 1) && UnresolvedNativeFunction_253(MatchesPerWeek, 2) != 0)
        {
            -- MatchesPerWeek;
        }
        MatchIdx = 0;
        J0x3B1:
        // End:0x3EC [Loop If]
        if(MatchIdx < MatchesPerWeek)
        {
            Matches.AddItem(Match);
            ++ MatchIdx;
            // [Loop Continue]
            goto J0x3B1;
        }
        TeamsRemaining -= MatchesPerWeek;
        ++ WeekIdx;
        // [Loop Continue]
        goto J0x318;
    }
    //return;    
}

function BuildBotTeams()
{
    local array<ProductAsset_Logo_TA> BotTeams;
    local ProductAsset_Logo_TA BotTeam;
    local ProductAsset_Bot_TA Bot;
    local SeasonTeam Team;
    local SeasonPlayer BotPlayer;
    local int TeamIdx, BotIdx;

    // End:0x136
    foreach class'GameData_TA'.default.Products.AllProducts(class'ProductAsset_Logo_TA', BotTeam, class'GameData_TA'.default.LogoSlot)
    {
        // End:0x11F
        if(((BotTeam.Bots.Length < TeamSize) || BotTeam.GetTeamName() ~= Teams[0].Name) || BotTeam.Name == Teams[0].LogoAsset)
        {
            continue;            
        }
        BotTeams.AddItem(BotTeam);        
    }
    J0x137:    
    // End:0x16A [Loop If]
    if(BotTeams.Length >= NumTeams)
    {
        BotTeams.Remove(Rand(BotTeams.Length), 1);
        J0x16A:
        // [Loop Continue]
        goto J0x137;
    }
    // End:0x377 [Loop If]
    if(BotTeams.Length > 0)
    {
        TeamIdx = Rand(BotTeams.Length);
        BotTeam = BotTeams[TeamIdx];
        BotTeams.Remove(TeamIdx, 1);
        // End:0x2E6
        foreach BotTeam.Bots(Bot, BotIdx)
        {
            // End:0x210
            if(BotIdx == TeamSize)
            {
                // End:0x2E6
                break;
            }
            BotPlayer.Id = string(Bot.Name);
            BotPlayer.Name = Bot.GetLabel();
            BotPlayer.Team = Teams.Length;
            BotPlayer.bBot = true;
            Players.AddItem(BotPlayer);            
        }        
        Team.Name = BotTeam.GetTeamName();
        Team.LogoAsset = BotTeam.Name;
        Teams.AddItem(Team);
        // [Loop Continue]
        goto J0x16A;
    }
    //return;    
}

final function bool IsFirstGameOfSeason(optional int Week)
{
    Week = CurrentWeek;
    return Week == 0;
    //return ReturnValue;    
}

final function bool IsRegularSeason(optional int Week)
{
    Week = CurrentWeek;
    return Week < NumRegularWeeks;
    //return ReturnValue;    
}

final function bool IsLastRegularSeason(optional int Week)
{
    Week = CurrentWeek;
    return Week == (NumRegularWeeks - 1);
    //return ReturnValue;    
}

final function bool IsPostSeason(optional int Week)
{
    Week = CurrentWeek;
    return Week >= NumRegularWeeks;
    //return ReturnValue;    
}

final function bool IsPlayoffs(optional int Week)
{
    Week = CurrentWeek;
    return (Week >= NumRegularWeeks) && Week < ((NumRegularWeeks + NumPlayoffsWeeks) - 1);
    //return ReturnValue;    
}

final function bool IsChampionship(optional int Week)
{
    Week = CurrentWeek;
    return Week >= ((NumRegularWeeks + NumPlayoffsWeeks) - 1);
    //return ReturnValue;    
}

final function int GetLastWeek()
{
    return Matches[Matches.Length - 1].Week;
    //return ReturnValue;    
}

final function bool IsFinished(optional int Week)
{
    Week = CurrentWeek;
    return Week > GetLastWeek();
    //return ReturnValue;    
}

final function int GetTotalSeasonWeeks()
{
    return NumRegularWeeks + NumPlayoffsWeeks;
    //return ReturnValue;    
}

final function int GetWins(int Team, int Week)
{
    local int Wins, MatchIdx;

    Wins = 0;
    MatchIdx = 0;
    J0x16:
    // End:0xB1 [Loop If]
    if((MatchIdx < Matches.Length) && Matches[MatchIdx].Week < Week)
    {
        // End:0xA3
        if(Matches[MatchIdx].Winner == Team)
        {
            ++ Wins;
        }
        ++ MatchIdx;
        // [Loop Continue]
        goto J0x16;
    }
    return Wins;
    //return ReturnValue;    
}

final function GetTeamRankings(int Week, out array<SeasonTeamRank> Rankings)
{
    local int TeamIdx, MatchIdx;

    Rankings.Length = Teams.Length;
    TeamIdx = 0;
    J0x20:
    // End:0x76 [Loop If]
    if(TeamIdx < Rankings.Length)
    {
        Rankings[TeamIdx].Team = TeamIdx;
        ++ TeamIdx;
        // [Loop Continue]
        goto J0x20;
    }
    MatchIdx = 0;
    J0x81:
    // End:0x3F1 [Loop If]
    if((MatchIdx < Matches.Length) && Matches[MatchIdx].Week < Week)
    {
        Rankings[Matches[MatchIdx].Team0].PointsFor += Matches[MatchIdx].Score0;
        Rankings[Matches[MatchIdx].Team0].PointsAgainst += Matches[MatchIdx].Score1;
        Rankings[Matches[MatchIdx].Team1].PointsFor += Matches[MatchIdx].Score1;
        Rankings[Matches[MatchIdx].Team1].PointsAgainst += Matches[MatchIdx].Score0;
        // End:0x359
        if(Matches[MatchIdx].Winner == Matches[MatchIdx].Team0)
        {
            ++ Rankings[Matches[MatchIdx].Team0].Wins;
            ++ Rankings[Matches[MatchIdx].Team1].Losses;
        }
        // End:0x3E3
        else
        {
            ++ Rankings[Matches[MatchIdx].Team1].Wins;
            ++ Rankings[Matches[MatchIdx].Team0].Losses;
        }
        ++ MatchIdx;
        // [Loop Continue]
        goto J0x81;
    }
    TeamIdx = 0;
    J0x3FC:
    // End:0x593 [Loop If]
    if(TeamIdx < Rankings.Length)
    {
        Rankings[TeamIdx].PointsDifferential = Rankings[TeamIdx].PointsFor - Rankings[TeamIdx].PointsAgainst;
        Rankings[TeamIdx].EliminationWeek = Teams[Rankings[TeamIdx].Team].EliminationWeek;
        // End:0x585
        if((Rankings[TeamIdx].EliminationWeek != -1) && Rankings[TeamIdx].EliminationWeek >= Week)
        {
            Rankings[TeamIdx].EliminationWeek = -1;
        }
        ++ TeamIdx;
        // [Loop Continue]
        goto J0x3FC;
    }
    Rankings.Sort(SortTeamRank);
    //return;    
}

private final function int SortTeamRank(SeasonTeamRank A, SeasonTeamRank B)
{
    // End:0xCC
    if(A.EliminationWeek != B.EliminationWeek)
    {
        // End:0x65
        if(A.EliminationWeek == -1)
        {
            return 1;
        }
        // End:0x91
        if(B.EliminationWeek == -1)
        {
            return -1;
        }
        return A.EliminationWeek - B.EliminationWeek;
    }
    // End:0x144
    if(A.Wins != B.Wins)
    {
        return A.Wins - B.Wins;
    }
    // End:0x1BC
    if(A.PointsDifferential != B.PointsDifferential)
    {
        return A.PointsDifferential - B.PointsDifferential;
    }
    // End:0x234
    if(A.PointsFor != B.PointsFor)
    {
        return A.PointsFor - A.PointsFor;
    }
    return B.Team - A.Team;
    //return ReturnValue;    
}

final function bool GetMatch(int Team, optional int Week, optional out SeasonMatch Match, optional out int MatchIdx, optional bool bReturnByes)
{
    Week = CurrentWeek;            
    MatchIdx = Matches.Find('Week', Week);
    J0x39:
    // End:0x16A [Loop If]
    if(((MatchIdx >= 0) && MatchIdx < Matches.Length) && Matches[MatchIdx].Week <= Week)
    {
        // End:0x15C
        if(((Matches[MatchIdx].Team0 == Team) || Matches[MatchIdx].Team1 == Team) || bReturnByes && Matches[MatchIdx].bBye)
        {
            Match = Matches[MatchIdx];
            return true;
        }
        ++ MatchIdx;
        // [Loop Continue]
        goto J0x39;
    }
    MatchIdx = -1;
    return false;
    //return ReturnValue;    
}

final function SaveMatch(SeasonMatch Match)
{
    local int MatchIdx;
    local SeasonMatch OldMatch;

    // End:0x65
    if(GetMatch(Match.Team0, CurrentWeek, OldMatch, MatchIdx))
    {
        Matches[MatchIdx] = Match;
    }
    // End:0xEB
    else
    {
        WarnInternal((((("Could not find match for teams " $ string(Match.Team0)) $ " vs ") $ string(Match.Team1)) $ " for week ") $ string(CurrentWeek));
    }
    //return;    
}

final function SimulateWeek(optional bool bForceHumansToWin)
{
    local int MatchIdx, Wins0, Wins1, Score0, Score1;

    local float WinRatio;
    local bool bEliminateLosers;

    // End:0x60D
    if(!IsFinished())
    {
        bEliminateLosers = IsPlayoffs() || IsChampionship();
        MatchIdx = Matches.Find('Week', CurrentWeek);
        J0x60:
        // End:0x559 [Loop If]
        if((MatchIdx < Matches.Length) && Matches[MatchIdx].Week <= CurrentWeek)
        {
            // End:0x450
            if(Matches[MatchIdx].Winner == -1)
            {
                Wins0 = GetWins(Matches[MatchIdx].Team0, CurrentWeek) + NumRegularWeeks;
                Wins1 = GetWins(Matches[MatchIdx].Team1, CurrentWeek) + NumRegularWeeks;
                WinRatio = float(Wins0) / float(Wins0 + Wins1);
                Score0 = Rand(FCeil(WinRatio * float(10)));
                Score1 = Rand(FCeil((1.0 - WinRatio) * float(10)));
                // End:0x238
                if(Score0 == Score1)
                {
                    // End:0x22D
                    if(FRand() <= WinRatio)
                    {
                        ++ Score0;
                    }
                    // End:0x238
                    else
                    {
                        ++ Score1;
                    }
                }
                // End:0x2EA
                if(bForceHumansToWin)
                {
                    // End:0x299
                    if(Matches[MatchIdx].Team0 == 0)
                    {
                        J0x271:
                        // End:0x296 [Loop If]
                        if(Score0 <= Score1)
                        {
                            ++ Score0;
                            // [Loop Continue]
                            goto J0x271;
                        }
                    }
                    // End:0x2EA
                    else
                    {
                        // End:0x2EA
                        if(Matches[MatchIdx].Team1 == 0)
                        {
                            J0x2C5:
                            // End:0x2EA [Loop If]
                            if(Score1 <= Score0)
                            {
                                ++ Score1;
                                // [Loop Continue]
                                goto J0x2C5;
                            }
                        }
                    }
                }
                // End:0x37A
                if(Score0 > Score1)
                {
                    Matches[MatchIdx].Winner = Matches[MatchIdx].Team0;
                    J0x34E:
                    // End:0x377 [Loop If]
                    if(Score1 > 5)
                    {
                        -- Score0;
                        -- Score1;
                        // [Loop Continue]
                        goto J0x34E;
                    }
                }
                // End:0x3F0
                else
                {
                    Matches[MatchIdx].Winner = Matches[MatchIdx].Team1;
                    J0x3C7:
                    // End:0x3F0 [Loop If]
                    if(Score0 > 5)
                    {
                        -- Score0;
                        -- Score1;
                        // [Loop Continue]
                        goto J0x3C7;
                    }
                }
                Matches[MatchIdx].Score0 = Score0;
                Matches[MatchIdx].Score1 = Score1;
            }
            // End:0x54B
            if(bEliminateLosers)
            {
                // End:0x4FE
                if(Matches[MatchIdx].Winner == Matches[MatchIdx].Team0)
                {
                    Teams[Matches[MatchIdx].Team1].EliminationWeek = CurrentWeek;
                }
                // End:0x54B
                else
                {
                    Teams[Matches[MatchIdx].Team0].EliminationWeek = CurrentWeek;
                }
            }
            ++ MatchIdx;
            // [Loop Continue]
            goto J0x60;
        }
        // End:0x596
        if(!IsPlayoffs(CurrentWeek) && IsPlayoffs(CurrentWeek + 1))
        {
            SelectPlayoffsTeams();
        }
        ++ CurrentWeek;
        // End:0x5D9
        if(IsPlayoffs(CurrentWeek) || IsChampionship(CurrentWeek))
        {
            BuildPlayoffsMatches();
        }
        J0x5D9:
        // End:0x60D [Loop If]
        if(!IsFinished() && !GetMatch(0))
        {
            super(Season_TA).SimulateWeek();
            // [Loop Continue]
            goto J0x5D9;
        }
    }
    EventWeekSimulated(self);
    //return;    
}

protected function SelectPlayoffsTeams()
{
    local array<SeasonTeamRank> Rankings;
    local int TeamIdx;

    GetTeamRankings(CurrentWeek + 1, Rankings);
    TeamIdx = NumPlayoffsTeams;
    J0x32:
    // End:0xA5 [Loop If]
    if(TeamIdx < Rankings.Length)
    {
        Teams[Rankings[TeamIdx].Team].EliminationWeek = CurrentWeek;
        ++ TeamIdx;
        // [Loop Continue]
        goto J0x32;
    }
    //return;    
}

protected function BuildPlayoffsMatches()
{
    local array<SeasonTeamRank> Rankings;
    local int NumMatches, HomeIdx, AwayIdx, WeekMatchIdx, MatchIdx;

    WeekMatchIdx = Matches.Find('Week', CurrentWeek);
    NumMatches = 0;
    MatchIdx = WeekMatchIdx;
    J0x47:
    // End:0xAE [Loop If]
    if((MatchIdx < Matches.Length) && Matches[MatchIdx].Week == CurrentWeek)
    {
        ++ NumMatches;
        ++ MatchIdx;
        // [Loop Continue]
        goto J0x47;
    }
    // End:0x11A
    if((CurrentWeek == NumRegularWeeks) && NumMatches < (NumPlayoffsTeams / 2))
    {
        HomeIdx = 2;
        Matches[WeekMatchIdx].bBye = true;
    }
    // End:0x125
    else
    {
        HomeIdx = 0;
    }
    AwayIdx = (HomeIdx + (NumMatches * 2)) - 1;
    GetTeamRankings(CurrentWeek, Rankings);
    MatchIdx = WeekMatchIdx;
    J0x179:
    // End:0x24E [Loop If]
    if(HomeIdx < AwayIdx)
    {
        Matches[MatchIdx].Team0 = Rankings[HomeIdx].Team;
        Matches[MatchIdx].Team1 = Rankings[AwayIdx].Team;
        ++ MatchIdx;
        ++ HomeIdx;
        -- AwayIdx;
        // [Loop Continue]
        goto J0x179;
    }
    //return;    
}

function SetBots(string BotID0, string BotName0, string BotID1, string BotName1, string BotID2, string BotName2)
{
    local int PlayerIdx;

    PlayerIdx = 0;
    J0x0B:
    // End:0x209 [Loop If]
    if(PlayerIdx < Players.Length)
    {
        // End:0x1FB
        if((Players[PlayerIdx].Team == 0) && Players[PlayerIdx].bBot)
        {
            // End:0xFA
            if(BotID0 != "")
            {
                Players[PlayerIdx].Name = BotName0;
                Players[PlayerIdx].Id = BotID0;
                BotID0 = "";
            }
            // End:0x1FB
            else
            {
                // End:0x179
                if(BotID1 != "")
                {
                    Players[PlayerIdx].Name = BotName1;
                    Players[PlayerIdx].Id = BotID1;
                    BotID1 = "";
                }
                // End:0x1FB
                else
                {
                    // End:0x1F8
                    if(BotID2 != "")
                    {
                        Players[PlayerIdx].Name = BotName2;
                        Players[PlayerIdx].Id = BotID2;
                        BotID2 = "";
                    }
                    // End:0x1FB
                    else
                    {
                        // [Explicit Break]
                        goto J0x209;
                    }
                }
            }
        }
        ++ PlayerIdx;
        J0x209:
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetDifficulty(int NewDifficulty)
{
    Difficulty = NewDifficulty;
    //return;    
}

function PrintRankings(const out array<SeasonTeamRank> Rankings)
{
    local SeasonTeamRank Rank;
    local int Idx;

    // End:0x125
    foreach Rankings(Rank, Idx)
    {
        LogInternal(string(Idx) @ Teams[Rank.Team].Name);
        LogInternal("Wins" @ string(Rank.Wins));
        LogInternal("Losses" @ string(Rank.Losses));
        LogInternal("PointsDiff" @ string(Rank.PointsDifferential));
        LogInternal("EliminationWeek" @ string(Rank.EliminationWeek));        
    }    
    //return;    
}
**/