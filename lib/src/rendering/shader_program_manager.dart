part of samba;

class ShaderProgramManager {
  Map<String, ShaderProgram> map;
  web_gl.RenderingContext _context;
  
  ShaderProgramManager(web_gl.RenderingContext context) {
    _context = context;
    map = new Map();
  }
  
  void create(String name, String vertexSource, String fragmentSource) {
    var program = new ShaderProgram(_context, vertexSource, fragmentSource);
    map[name] = program;
  }
}
