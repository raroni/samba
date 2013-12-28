part of samba;

abstract class Director {
  Game game;
  Scene scene;
  
  void initialize() {
    setScene(createInitialScene());
  }
  
  void setScene(Scene scene) {
    this.scene = scene;
    scene.game = game;
    scene.initialize();
  }
  
  void update() {
    if(this.scene.completed) {
      var nextScene = this.createNextScene();
      game.sequencer.grow();
      scene.destroy();
      game.sequencer.trim();
      setScene(nextScene);
    }
  }
  
  Scene createInitialScene();
  Scene createNextScene();
}
