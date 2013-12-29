part of samba;

abstract class Scene extends Node {
  Game game;
  bool completed = false;
  
  SceneSequencer get sequencer {
    if(game == null) return null;
    return game.sequencer;
  }
  
  void initialize();
}
