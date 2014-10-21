FlurryX
=======

Flurry Analytics C++ wrapper for Cocos2d-x

Usage:

```c++
map<string, string> parameters = { { "finished", "1" }, { "winner", "player1" } };
FlurryX::endTimedEvent("Game", parameters);
```