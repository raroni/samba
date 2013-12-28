part of samba;

abstract class Game {
  final Renderer renderer;
  Director director;
  final ComponentRegistry components = new ComponentRegistry();
  final SceneSequencer sequencer = new SceneSequencer();
  num _lastTickAt = 0;
  
  Game(html.CanvasElement canvas) : renderer = new Renderer(canvas) {
    sequencer.components = components;
    director = createDirector();
    director.game = this;
  }
  
  Director createDirector();
  
  void initialize() {
    director.initialize();
  }
  
  void run() {
    loop(0);
  }
  
  void tick(num timeDelta) {
    director.update();
    components.update(timeDelta);
    renderer.draw();
  }
  
  void loop(num time) {
    var timeDelta = time - _lastTickAt;
    tick(timeDelta);
    html.window.animationFrame.then(loop);
    _lastTickAt = time;
  }
}
