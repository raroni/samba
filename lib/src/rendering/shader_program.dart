part of samba;

class ShaderProgram {
  WebGL.RenderingContext _context;
  WebGL.Program _handle;
  
  ShaderProgram(WebGL.RenderingContext context, vertexShaderSource, String fragmentShaderSource) {
    _context = context;
    
    WebGL.Shader vertexShaderHandle = createShader(WebGL.VERTEX_SHADER, vertexShaderSource);
    WebGL.Shader fragmentShaderHandle = createShader(WebGL.FRAGMENT_SHADER, fragmentShaderSource);
        
    _handle = context.createProgram();
    context.attachShader(_handle, vertexShaderHandle);
    context.attachShader(_handle, fragmentShaderHandle);
    
    context.linkProgram(_handle);
    
    if (!context.getProgramParameter(_handle, WebGL.LINK_STATUS)) {
      print("Linking error: " + context.getProgramInfoLog(_handle));
    }
  }
  
  WebGL.Shader createShader(int type, String source) {
    WebGL.Shader handle = _context.createShader(type);
    _context.shaderSource(handle, source);
    _context.compileShader(handle);
    
    if(!_context.getShaderParameter(handle, WebGL.COMPILE_STATUS)) {
      print("Shader compile error: " + _context.getShaderInfoLog(handle));
    }
    
    return handle;
  }
}
