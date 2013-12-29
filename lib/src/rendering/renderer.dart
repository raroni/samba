part of samba;

class Renderer {
  WebGL.RenderingContext _context;
  ShaderProgramManager programs;
  LensManager lensManager;
  
  Renderer(HTML.CanvasElement canvas) {
    _context = canvas.getContext("webgl");
    programs = new ShaderProgramManager(_context);
  }
  
  void draw() {
    for(PerspectiveLens lens in lensManager.perspectiveLenses) {
      
    }
  }
}
