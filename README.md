FlurryX
=======

Flurry Analytics C++ wrapper for iOS and Android.

Usage:

```c++
map<string, string> parameters = { { "finished", "1" }, { "winner", "player1" } };
FlurryX::endTimedEvent("Game", parameters);
```