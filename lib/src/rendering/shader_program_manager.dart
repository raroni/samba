part of samba;

class ShaderProgramManager {
  Map<String, ShaderProgram> map;
  WebGL.RenderingContext _context;
  
  ShaderProgramManager(WebGL.RenderingContext context) {
    _context = context;
    map = new Map();
  }
  
  void create(String name, String vertexSource, String fragmentSource) {
    var program = new ShaderProgram(_context, vertexSource, fragmentSource);
    map[name] = program;
  }
}
