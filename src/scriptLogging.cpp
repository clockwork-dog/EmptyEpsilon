#include "engine.h"

static int log_info(lua_State* L)
{
    const char* str = luaL_checkstring(L, 1);
    LOG(INFO) << "SCRIPT: " << str;
    return 1;
}
REGISTER_SCRIPT_FUNCTION(log_info);

