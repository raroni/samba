part of samba;

class Renderer {
  web_gl.RenderingContext _context;
  ShaderProgramManager programs;
  
  Renderer(html.CanvasElement canvas) {
    _context = canvas.getContext("webgl");
    programs = new ShaderProgramManager(_context);
  }
  
  void draw() {
    
  }
}
