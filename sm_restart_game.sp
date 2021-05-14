#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#define ADMFLAG_RR ADMFLAG_GENERIC

public Plugin myinfo = {
    name        = "Restart Game",
    author      = "rdbo",
    description = "Admin Restart Game",
    version     = "1.0.0",
    url         = ""
};

public void OnPluginStart()
{
    PrintToServer("[SM] Restart Game Loaded");
    RegAdminCmd("sm_rr", CMD_RestartGame, ADMFLAG_RR, "Restarts the Game");
}

public Action CMD_RestartGame(int client, int args)
{
    int secs = 0;
    
    if (args > 0)
    {
        char buf[64];
        GetCmdArg(1, buf, sizeof(buf));
        secs = StringToInt(buf);
    }
    
    PrintToChatAll("[SM] Restarting Game in '%i' seconds...", secs);
    ServerCommand("mp_restartgame %i", secs);
    
    return Plugin_Handled;
}
