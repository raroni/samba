part of samba;

class ShaderProgramManager {
  final Map<String, ShaderProgram> _map = new Map<String, ShaderProgram>();
  WebGL.RenderingContext _context;
  
  ShaderProgramManager(WebGL.RenderingContext context) {
    _context = context;
  }
  
  void create(String name, String vertexSource, String fragmentSource) {
    var program = new ShaderProgram(_context, vertexSource, fragmentSource);
    _map[name] = program;
  }
  
  ShaderProgram get(String name) {
    var program = _map[name];
    if(program == null) throw new Exception("Shader program not found.");
    return program;
  }
}
